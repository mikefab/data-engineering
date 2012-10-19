class Merchant < ActiveRecord::Base
  attr_accessible :address, :name
  has_many :orders
  has_many :purchasers
end
  