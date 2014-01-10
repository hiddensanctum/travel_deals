require 'spec_helper'

feature "View deal index" do

  context "as a vistor" do
    scenario "shows you hotel deals" do
      visit root_path

      # Page should have nav bar and title
      page.should have_content('Where Should I Go For Vacation')
      page.should have_content('Country Code')
      page.should have_content('Hotel Rating')
      page.should have_content('Price')

      # Page should have deals
      page.should have_content('Total')
      page.should have_content('Price Per Night')
      page.should have_content('Book')
    end

    scenario "shows you button to go to expdia's site to book hotel" do
      visit root_path

      # Within one of the modals
      within(:xpath, '//*[@id="1213446"]') do
        page.should have_content('Book')
        find_link('Book').visible?
      end
    end

    scenario "shows you only US deals" do
      visit (root_path.to_s + "/?options=country%3DUSA")

      page.all(:xpath, '//*[@id="country"]').each do |el|
        el.should have_content('USA')
      end
    end
    scenario "shows you 5 or above star hotel deals" do
      visit (root_path.to_s + "/?options=minStarRating%3D5")

      # loop through all deals to make sure hotel rating is 5
      page.all(:xpath, '//*[@id="star"]').each do |el|
        el.should have_css("Rating5_0.png")
      end
    end
    scenario "shows you only deals that are $100 or under" do
      visit (root_path.to_s + "/?options=maxTotalRate%3D100")

      page.should have_content('40.53')
    end
    scenario "shows you only deals that are on 2014-02-20" do
      visit (root_path.to_s + "/?options=checkInDate%3D2014-02-20")

      page.should have_content('2014-02-20')
    end
  end
end
