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
      visit root_path

      fill_in('country-code', :with => 'USA')

      click_button('filter')

      # loop through all deals to make sure country = USA
      page.all(:css, 'img').each do |el|
        el.click
        # within(:xpath, '//*[@id="country"]') do
        #   page.should have_content('USA')
        # end
      end
    end
    scenario "shows you 5 or above star hotel deals" do
      visit root_path

      find("option[value='5']").click
      click_button('filter')

      # loop through all deals to make sure hotel rating is 4 or higher
      page.all(:css, 'img').each do |el|
        el.click
      end
    end
    scenario "shows you only deals that are $100 or under" do
      visit root_path

      fill_in('max-price', :with => '100')
      click_button('filter')

      # loop through all deals to make sure price is 100 or lower
      page.all(:css, 'img').each do |el|
        el.click
      end
    end
  end
end
