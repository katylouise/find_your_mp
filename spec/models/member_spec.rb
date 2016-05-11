require 'rails_helper'
require 'response_stubs/json_member_data_stub'

describe Member, type: :model do

	describe '#set_properties' do
		before(:each) do
			@member = Member.new
			@member.set_properties(JSON.parse(JSON_MEMBER_DATA_STUB, :quirks_mode => true))
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