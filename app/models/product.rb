class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, :through => :reviews

  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 3}
  validates :price_in_cents, presence: true

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

end
