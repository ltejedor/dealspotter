require 'spec_helper'

feature "Viewing deals" do
	before do
		Capybara.current_driver = :selenium
		@deals = HTTParty.get('http://deals.expedia.com/beta/deals/hotels.json')
		@example = @deals.first
		@name = @example['name']
		@city = @example['city']
		@latitude = @example['latitude']
		visit '/'
	end
	scenario "Listing all deals" do
		page.should have_content @name
		page.should have_content @city
	end

	scenario "Address links to map" do
		visit '/'
		page.should have_content "Welcome to Deal Spotter"
		click_link @city
		page.should_not have_content "Welcome to Deal Spotter"
	end

	scenario "Learn more links to expedia site" do
		visit '/'
		page.should have_content "Welcome to Deal Spotter"
		click_button 'Learn More'
		page.should_not have_content "Welcome to Deal Spotter"
	end

end

