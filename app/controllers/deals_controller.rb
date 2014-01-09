class DealsController < ApplicationController

	def index
		@deals = get_deals(params[:options])
		@date = @deals[0]['checkInDate']

		if params[:options]
			@deals = @deals.sort_by { |deal| deal['baseRate'] }
		end
	end

	private

	def get_deals(value)
		url = 'http://deals.expedia.com/beta/deals/hotels.json?' + URI.encode(value.to_s)
		puts url
		HTTParty.get(url)
	end
end
