class Category < ActiveRecord::Base

  has_many :products
  validates :name, length: { minimum: 3 }
end
