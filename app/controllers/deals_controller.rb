class DealsController < ApplicationController

	def index
		@deals = get_deals(params[:options]).sort_by { |deal| deal['promotionAmount'] }.reverse
		if @deals == []
			@date = 'N/A'
		else
			@date = @deals[0]['checkInDate']
		end
	end

	def get_rating_img(deal)
		if deal['guestRating'] == 5
			image_tag("urating5_0.png")
		elsif deal['guestRating'] >= 4.5
			image_tag("urating4_5.png")
		elsif deal['guestRating'] >= 4.0
			image_tag("urating4_0.png")
		elsif deal['guestRating'] >= 3.5
		 image_tag("urating3_5.png")
		elsif deal['guestRating'] >= 3.0
			image_tag("urating3_0.png")
		elsif deal['guestRating'] >= 2.5
			image_tag("urating2_5.png")
		elsif deal['guestRating'] >= 2.0
			image_tag("urating2_0.png")
		elsif deal['guestRating'] >= 1.5
			image_tag("urating1_5.png")
		elsif deal['guestRating'] >= 1.0
			image_tag("urating1_0.png")
		elsif deal['guestRating'] >= 0.5
			image_tag("urating0_5.png")
		else
			image_tag("urating0_0.png")
		end
	end

	private

	def get_deals(value)
		url = 'http://deals.expedia.com/beta/deals/hotels.json?' + URI.encode(value.to_s)
		HTTParty.get(url)
	end
end
