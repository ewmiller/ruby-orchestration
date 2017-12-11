require 'sinatra'
require_relative './lib/orchestration_functions.rb'

get '/' do 
  'Put this in your pipe and orchestrate it!'
end

post '/api/v2/orchestration' do
  'Received POST request'
  process_json(request.body.read)
end