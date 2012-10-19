class UploadsController < ApplicationController
  def index
    if params[:myfile].present?                             #Check if a file has been uploaded
      @total = Order.process_orders(params[:myfile].read)   #parse, normalize, save data from order, and return sum of all orders submitted
    end
  end
end
