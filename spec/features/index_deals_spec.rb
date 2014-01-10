require 'spec_helper'

feature "View deal index" do

  context "as a vistor" do
    context "with valid input" do
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
          el.should have_content('5.0/5.0')
        end
      end

      scenario "shows you only deals that are $100 or under" do
        visit (root_path.to_s + "/?options=maxTotalRate%3D100")

        page.should have_content('40.53')
      end

      scenario "shows you only deals that are on 2014-02-20" do
        visit (root_path.to_s + "/?options=checkInDate%3D2014-02-20")

        page.should have_content('2014-02-20')
        page.should have_no_content('N/A')
      end

      scenario "shows you only deals in NY State" do
        visit (root_path.to_s + "/?options=province%3DNY")

        # loop through all deals to make sure state is NY
        page.all(:xpath, '//*[@id="location"]').each do |el|
          el.should have_content('NY')
        end
      end

      scenario "shows you only deals in Toronto" do
        visit (root_path.to_s + "/?options=city%3DToronto")

        # loop through all deals to make sure city is Toronto
        page.all(:xpath, '//*[@id="location"]').each do |el|
          el.should have_content('Toronto')
        end
      end

      scenario "shows you only deals that are for 5 days" do
        visit (root_path.to_s + "/?options=lengthofStay%3D5")

        page.should have_content('For 5 days')
        page.should have_no_content('For 3 days')
      end

      # scenario "shows you only deals that are from Canada", :js => true do
      #   visit root_path

      #   fill_in('country-code', :with => 'CAN')
      #   fill_in('province', :with => 'ON')
      #   fill_in('city', :with => 'Toronto')
      #   fill_in('checkin', :with => '2014-02-19')
      #   fill_in('days', :with => '2')
      #   fill_in('max-price', :with => '200')

      #   click_button('filter')

      #   page.should have_content('For 2 days')
      #   page.should have_content('Check-in Date: 2014-02-19')

      #   page.all(:css, 'img').each do |el|
      #     el.click
      #     page.should have_content('Toronto')
      #     page.should have_content('ON')
      #     within(:xpath, '//*[@id="country"]') do
      #       page.should have_content('CAN')
      #     end
      #   end
      # end
    end
    context "with invalid input" do

      scenario "enter wrong info like Toronto, NY" do
        visit (root_path.to_s + "/?options=city%3DToronto%3Dprovince%3DNY")

        page.should have_content('No Deals Found')
        page.should have_content('Check-in Date: N/A')
        page.should have_no_content('Check-in Date: 2014-02-09')
      end

      scenario "enter wrong info like -1 day" do
        visit (root_path.to_s + "/?options=lengthofStay%3D-1")

        page.should have_content('No Deals Found')
        page.should have_content('Check-in Date: N/A')
        page.should have_no_content('Check-in Date: 2014-02-09')
      end

      # scenario "enters invalid country code", :js => true do
      #   visit root_path
      #   fill_in('country-code', :with => 'LLL')
      #   click_button('filter')

      #   page.should have_content('No Deals Found')
      #   page.should have_content('Check-in Date: N/A')
      #   page.should have_no_content('Check-in Date: 2014-02-09')
      # end
    end
  end
end
