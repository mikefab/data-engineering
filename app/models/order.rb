require 'bigdecimal'
class Order < ActiveRecord::Base
  attr_accessible :amount, :item_id, :merchant_id, :purchaser_id
  
  belongs_to :merchant
  belongs_to :item
  belongs_to :purchaser
    
  def self.process_orders(orders_string)  #Loops through orders, saving each to the db, and returns the sum of orders 
    orders = orders_string.split(/\n/)                  #convert string to array of orders
    orders.shift                                        #remove header
    total = 0                                           #record sum value of orders in file
    total = BigDecimal(0)
    orders.map{|order| total += save_order(order).to_f} #send order to function that normalizes data and saves to db, while total is summed.
    return (("%.2f" % total)).commify                    #ensure that the sum of all orders is commified and ends with two digets past the decimal
  end
  
  def self.save_order(order)
    purchaser_name, item_description, item_price, amount, merchant_address, merchant = order.split(/\t/)      #parse order by tab
    merchant  = Merchant.find_or_create_by_name(merchant)
    purchaser = Purchaser.find_or_create_by_name_and_merchant_id(purchaser_name, merchant.id)
    item      = Item.find_or_create_by_description_and_price(item_description, item_price)
    Order.create(:amount => amount, :item_id => item.id, :merchant_id => merchant.id, :purchaser_id => purchaser.id) #save order
    BigDecimal(item_price) * amount.to_i #return sum of order
  end

end
