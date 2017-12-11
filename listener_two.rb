require 'sinatra'

set :port, 8081

post '/api/dns' do 
  'Received DNS request'
  puts('Received DNS request')
  puts(JSON.parse(request.body.read))
end