class DealsController < ApplicationController

	def index
		@deals = get_deals(params[:options]).sort_by { |deal| deal['promotionAmount'] }.reverse

		if @deals == []
			@date = 'N/A'
		else
			@date = @deals[0]['checkInDate']
		end
	end

	private

	def get_deals(value)
		url = 'http://deals.expedia.com/beta/deals/hotels.json?' + URI.encode(value.to_s)
		HTTParty.get(url)
	end
end
