require 'net/http'
require 'json'
require 'uri'

class Orchestrator

  # provide the list of supported microservice endpoints (required)
  def initialize(service_endpoints)
    @service_endpoints = service_endpoints
    puts(@service_endpoints)
  end

  def send_request(uri, data)
    begin
      res = Net::HTTP.post(uri, data)
      puts res.body
    rescue
      puts("Error occurred when trying to send request to " + uri.to_s)
    end
  end

  def process_request(json_body)
    puts("received json body")

    data = JSON.parse(json_body)

    # for each endpoint we support, look for corresponding data in the request and send it
    @service_endpoints.keys.each do |endpoint|
      this_endpoint = @service_endpoints[endpoint]
      puts("Sending data to: ")
      puts(this_endpoint)
      uri = URI.parse(this_endpoint)
      request_data = data["services"][endpoint]
      if(request_data != nil)
        send_request(uri, request_data.to_json)
      end
    end
  end # end process_request

end
