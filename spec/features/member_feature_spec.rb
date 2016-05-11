require 'rails_helper'
require 'json_view_stub/json_view_stub'

feature 'members' do

	context 'no search has been made yet' do
		scenario 'should display an input box and a "Find" button' do
			visit members_path
			expect(page).to have_selector('input[name="postcode"]')
			expect(page).to have_button 'Find'
		end
	end

	context 'after searching with postcode on successful result' do
		before(:each) do
	        visit members_path
			fill_in 'postcode', with: 'E2 9JH'
			click_button 'Find'
		end

		scenario 'should redirect to member id page' do
			expect(current_path).to eq('/members/4138')
		end

		scenario 'should display the correct information related to the member' do
			expect(page).to have_content('Rushanara Ali MP')
			expect(page).to have_css('img[src*="http://data.parliament.uk/membersdataplatform/services/images/MemberPhoto/4138/"]')
		end

	  scenario 'should display JSON format when the uri is followed by .json' do
	  	visit(current_path + '.json')
			expect(page).to have_content(JSON_VIEW_STUB)
		end

	end
end