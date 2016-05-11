class Member

	attr_reader :name, :member_id, :image_link

	def set_properties(response)
		@name = response['Members']['Member']['FullTitle']
    @member_id = response['Members']['Member']['Member_Id']
    @image_link = image_link_builder(@member_id)
	end

  private

  def image_link_builder(id)
    "http://data.parliament.uk/membersdataplatform/services/images/MemberPhoto/#{id}/"
  end

end