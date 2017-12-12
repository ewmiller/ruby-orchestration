require 'sinatra'
require_relative './lib/orchestration_functions.rb'

get '/' do
  'Put this in your pipe and orchestrate it!'
end

post '/api/v2/orchestration' do
  'Received POST request'
  request_body = request.body.read
  process_json(request_body)
end
