class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @time = Time.now.strftime("%H:%M:%S") 
  	@counter = session[:counter]
	if @counter.nil?
		@counter = 0;
	else
		@counter += 1;
	end
	session[:counter] = @counter		
  end
end
