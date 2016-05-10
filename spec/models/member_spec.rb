require 'rails_helper'

describe Member, type: :model do

	describe '#set_properties' do 
		it 'sets the name from the api response' do 
			uri = URI('http://data.parliament.uk/membersdataplatform/services/mnis/members/query/fymp=e29jn/Committees%7CBiographyEntries%7CInterests/')
			response = Net::HTTP.get(uri)
			member = Member.new
			member.set_properties(JSON.parse(response, :quirks_mode => true))
			expect(member.name).to eq 'Rushanara Ali MP'
		end
	end

	# describe '#get_data' do
	# 	feature 'External request' do
	# 		it 'queries mnis' do
	# 		    uri = URI('http://data.parliament.uk/membersdataplatform/services/mnis/members/query/fymp=e29jn/Committees%7CBiographyEntries%7CInterests/')
	# 		    response = Net::HTTP.get(uri)
	# 		    expect(response).to be_an_instance_of(String)
	# 		end
	# 	end
	# end
  end