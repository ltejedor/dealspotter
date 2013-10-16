require 'spec_helper'

feature "Viewing deals" do
	before do
		Capybara.current_driver = :selenium
		@deals = HTTParty.get('http://deals.expedia.com/beta/deals/hotels.json')
		@example = @deals.first
		@name = @example['name']
		@city = @example['city']
		visit '/'
	end
	scenario "Listing all deals" do
		page.should have_content @name
		page.should have_content @city
	end

	scenario "Address links to map" do
		visit '/'
		click_link @city
		page.should_not have_content @city
	end

	scenario "Learn more links to expedia site" do
		visit '/'
		click_button 'Learn More'
		page.should_not have_content @name
	end

end

