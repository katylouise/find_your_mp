require_relative '../../lib/data_api_call'

class MembersController < ApplicationController

	def index
	end
	
	def fetch
		@data_call = DataApiCall.new
		@member_data = @data_call.get_data(params[:postcode])
		redirect_to member_path(id: @member_data["Members"]["Member"]["Member_Id"])
	end

	def show
		
	end
end
