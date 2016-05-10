class MembersController < ApplicationController

	def index
	end
	
	def fetch
		member = Member.new
		member_data = member.get_data(params[:postcode])
		redirect_to member_path(id: member_data["Members"]["Member"]["Member_Id"])
	end

	def show
		
	end
end
