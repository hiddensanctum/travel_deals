require 'spec_helper'

feature "View deal index" do

  context "as a vistor" do
    scenario "shows you hotel deals" do
      visit root_path

      # Page should have nav bar and title
      page.should have_content('Get Out Of Town')
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

    scenario "shows you only US deals", :js => true do
      visit root_path

      fill_in('country-code', :with => 'USA')
      save_and_open_page

      click_button('filter')

      # loop through all deals to make sure country = USA
      page.all(:css, 'img').each do |el|
        el.click
        page.should have_content('USA')
      end
    end
    scenario "shows you 4 or above star hotel deals", :js => true do
      visit root_path

      find("option[value='4']").click
      click_button('filter')

      # loop through all deals to make sure hotel rating is 4 or higher
      page.all(:css, 'img').each do |el|
        el.click
        page.should have_no_content('3.5')
        page.should have_no_content('3.0')
        page.should have_no_content('2.5')
        page.should have_no_content('2.0')
        page.should have_no_content('1.5')
        page.should have_no_content('1.0')
      end
    end
    scenario "shows you only deals that are $100 or under", :js => true do
      visit root_path

      fill_in('max-price', :with => '100')
      click_button('filter')

      # loop through all deals to make sure price is 100 or lower
      page.all(:css, 'img').each do |el|
        el.click
        page.should have_no_content('200')
      end
    end
  end
end
