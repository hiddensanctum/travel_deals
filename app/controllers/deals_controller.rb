class DealsController < ApplicationController

	def index
		@deals = get_deals(params[:options])
	end

	private

	def get_deals(value)
		url = 'http://deals.expedia.com/beta/deals/hotels.json?' + value.to_s
		HTTParty.get(url)
	end
end
