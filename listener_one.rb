require 'sinatra'

set :port, 8080

post '/api/firewall' do 
  'Received firewall request'
  puts('Received firewall request')
  puts(JSON.parse(request.body.read))
end