class ProductsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:show]
	#before_filter :ensure_logged_in, :only =>[:show] #ensure_logged_in would be method defined in ApplicationController
	# before_filter : load_product, only: [:show, :edit, :update, :destroy] # if this is done then we can take out 
																			#the line @product = Product.find(params[:id]) from the methods below :show, :edit, :update, :destroy] 
  def index
  	 # @products = Product.order('products.created_at :desc').page(params[:page])
     #alternate syntax of the above line would be
     @products = Product.order('products.created_at DESC').page(params[:page])
  
    respond_to do |format|
      format.js # allows the controller to respond to Javascript
      format.html
    end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to @product
  	else
  		render :new
  	end
  	# render text: params[:product].inspect
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  		redirect_to @product
  	else
  		render 'edit'
  	end
  end
  
  def show
  	@product = Product.find(params[:id])
  	if current_user
  		@review = @product.reviews.build
  	end
  end
  

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to @product
  end

  private
  def product_params
  	params.require(:product).permit(:name,:description,:price_in_cents)
  end
end
