class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :sale
  belongs_to :purchase
  	
  validates :name, presence: true
  validates :price, presence: true
end
