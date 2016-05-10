require 'rails_helper'

describe Member, type: :model do

	describe '#set_properties' do
		before(:each) do
			uri = URI('http://data.parliament.uk/membersdataplatform/services/mnis/members/query/fymp=e29jn/Committees%7CBiographyEntries%7CInterests/')
			response = Net::HTTP.get(uri)
			@member = Member.new
			@member.set_properties(JSON.parse(response, :quirks_mode => true))
		end
		it 'sets the name correctly' do
			expect(@member.name).to eq 'Rushanara Ali MP'
		end

		it 'sets the id correctly' do
			expect(@member.member_id).to eq '4138'
		end

		it 'generates the link for the image' do
			expect(@member.image_link).to eq 'http://data.parliament.uk/membersdataplatform/services/images/MemberPhoto/4138/'
		end
	end

end