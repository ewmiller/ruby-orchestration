require 'sinatra'
require 'sinatra/config_file'
require_relative './lib/orchestrator.rb'

config_file './config.yml'


orchestrator = Orchestrator.new(settings.service_endpoints)

get '/' do
  'Put this in your pipe and orchestrate it!'
end

post settings.api_endpoint do
  request_body = request.body.read
  orchestrator.process_request(request_body)
  'Received POST request'
end
