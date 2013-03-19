class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @time = Time.now.strftime("%H:%M:%S") 
  end
end
