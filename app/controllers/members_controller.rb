require_relative '../../lib/data_api_call'

class MembersController < ApplicationController

	def index
	end
	
	def fetch
		@data_call = DataApiCall.new
		@member_data = @data_call.get_data(params[:postcode])
		@id = @member_data["Members"]["Member"]["Member_Id"]
		$redis.set("member_data", @member_data.to_json)
		redirect_to member_path(id: @id)
	end

	def show
		@data = JSON.load($redis.get("member_data"))
	end
end
