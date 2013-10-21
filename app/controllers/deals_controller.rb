class DealsController < ApplicationController

	def index
		@deals = HTTParty.get('http://deals.expedia.com/beta/deals/hotels.json')
	end


end
