require 'net/http'
require 'json'
require 'uri'

class Orchestrator

  # provide the path for a properties file (required)
  def initialize(properties_path)
    file = File.read(properties_path)

    begin
      @properties = JSON.parse(file)
      @endpoint_names = @properties["endpoints"].keys
    rescue
      puts("Error while reading properties file. Exiting.")
      exit
    end
  end

  def send_request(uri, data)
    puts("sending request")
    res = Net::HTTP.post(uri, data)
    puts res.body
  end

  def process_request(json_body)
    puts("received json body")

    data = JSON.parse(json_body)

    # for each endpoint we support, look for corresponding data in the request and send it
    @endpoint_names.each do |endpoint|
      this_endpoint = @properties["endpoints"][endpoint]
      puts("Sending data to: ")
      puts(this_endpoint)
      uri = URI.parse(this_endpoint)
      request_data = data["services"][endpoint]
      if(request_data != nil)
        send_request(uri, request_data.to_json)
      end
    end
  end # end process_request

  def get_api_endpoint 
    return @properties["api_endpoint"]
  end

end
