class Product < ActiveRecord::Base
   validates :name, presence: true, length: {minimum: 3}
   	validates :description, presence: true, length: {minimum: 3}
   	validates :price_in_cents, presence: true
end
