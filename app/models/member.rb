class Member

	attr_reader :name

	def initialize
		@name
	end

	def set_properties(response)
		@name = response['Members']['Member']['FullTitle']
	end

end