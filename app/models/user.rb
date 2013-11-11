class User < ActiveRecord::Base
 has_secure_password # automatically creates
 					 # aat_accessible :pasowrd, :password_confirmation
 has_many :reviews
 has_many :products, :through => :reviews

end
