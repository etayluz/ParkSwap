require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    'Hello World from MyApp in separate file!'
  end
end
