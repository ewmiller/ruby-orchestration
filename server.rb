require 'sinatra'
require 'sinatra/config_file'
require_relative './lib/orchestrator.rb'

config_file './config.yml'
puts(settings.api_endpoint)

get '/' do
  'Put this in your pipe and orchestrate it!'
end

post settings.api_endpoint do
  'Received POST request'
  request_body = request.body.read
  orchestrator.process_request(request_body)
end
