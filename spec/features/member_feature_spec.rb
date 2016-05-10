require 'rails_helper'

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
			stub_request(:get, "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/fymp=E29JH/").
         	with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         	to_return(:status => 200, :body => "<Members><Member Member_Id=\"4138\" Dods_Id=\"58561\" Pims_Id=\"5735\"><DisplayAs>Rushanara Ali</DisplayAs><ListAs>Ali, Rushanara</ListAs><FullTitle>Rushanara Ali MP</FullTitle><LayingMinisterName/><DateOfBirth>1975-03-14T00:00:00</DateOfBirth><DateOfDeath xsi:nil=\"true\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"/><Gender>F</Gender><Party Id=\"15\">Labour</Party><House>Commons</House><MemberFrom>Bethnal Green and Bow</MemberFrom><HouseStartDate>2010-05-06T00:00:00</HouseStartDate><HouseEndDate xsi:nil=\"true\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"/><CurrentStatus Id=\"0\" IsActive=\"True\"><Name>Current Member</Name><Reason/><StartDate>2015-05-07T00:00:00</StartDate></CurrentStatus></Member></Members>", :headers => {})
      visit members_path
			fill_in 'postcode', with: 'E2 9JH'
			click_button 'Find'
		end

		scenario 'should redirect to member id page' do
			expect(current_path).to eq('/members/4138')
			expect(page).to have_content('Rushanara Ali MP')
		end

		scenario 'should display the image with the correct link' do
			expect(page).to have_css("img[src*='http://data.parliament.uk/membersdataplatform/services/images/MemberPhoto/4138/']")
		end
	end
end