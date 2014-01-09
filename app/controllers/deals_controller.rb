class DealsController < ApplicationController

	def index
		puts params[:find]
		@deals = get_deals(params[:find])
	end

	private

	def get_deals(value)
		puts value
		url = 'http://deals.expedia.com/beta/deals/hotels.json?' + value.to_s
		HTTParty.get(url)
	end
end
