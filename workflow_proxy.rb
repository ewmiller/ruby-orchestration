require 'sinatra'
require_relative './lib/orchestrator.rb'

orchestrator = Orchestrator.new('./properties.json')

get '/' do
  'Put this in your pipe and orchestrate it!'
end

post '/api/v2/orchestration' do
  'Received POST request'
  request_body = request.body.read
  orchestrator.process_request(request_body)
end
