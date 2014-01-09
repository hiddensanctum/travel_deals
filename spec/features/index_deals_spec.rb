require 'spec_helper'

feature "View deal index" do

  context "as a vistor" do
    scenario "shows you hotel deals" do
      visit root_path

      # Page should have nav bar and title
      page.should have_content('Get Out Of Town')
      page.should have_content('Destination')
      page.should have_content('USA')
      page.should have_content('Anywhere')

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

    scenario "shows you only US deals specify US only" do
      visit root_path

      find_link('USA').click

      all('a').each { |a| a[:href] }

      page.should have_no_content('Book')

    end
  end
end
