require 'rubygems'  
require 'sinatra'

get '/' do  
  "Hello, World!"  
end 

get '/about' do  
  'A little about me.'  
end 

get '/hello/:name' do  
  params[:name]  
end 

get '/hello/:latitude' do
  params[:latitude]
end
