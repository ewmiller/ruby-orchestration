require 'net/http'
require 'json'

def send_request(uri, data)
  puts("sending request")
  res = Net::HTTP.post(uri, data)
  puts res.body
end

def process_json(json_body)
  puts("received json body")

  data = JSON.parse(json_body)
  firewall_uri = URI('http://localhost:8080/api/firewall')
  dns_uri = URI('http://localhost:8081/api/dns')

  firewall_data = data["microservices"]["firewall"].to_json
  puts("firewall data: " + firewall_data)
  dns_data = data["microservices"]["dns"].to_json
  puts("dns data: " + dns_data)

  send_request(firewall_uri, firewall_data)
  send_request(dns_uri, dns_data)

end
