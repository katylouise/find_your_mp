require 'net/http'
require 'crack'

class DataApiCall
	def get_data(postcode)
		url = url_builder(postcode)
		req = request(url)
		res = response(url, req)
		convert_xml_to_json(res)
	end

	private

	def url_builder(postcode)
		postcode = postcode.tr(" ", "")
		url = "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/fymp=#{postcode}/"
		URI.parse(url)
	end

	def request(uri)
		Net::HTTP::Get.new(uri)
	end

	def response(uri, req)
		res = Net::HTTP.new(uri.host, uri.port)
		res.request(req).body
	end

	def convert_xml_to_json(xml)
		Crack::XML.parse(xml)
	end
end