require 'rubygems'
require 'sinatra'
require 'sinatra/logger'
set :root, '/Users/etayluz/ParkSwap/Backend'
require 'bundler'

Bundler.require

require './myapp'

root = ::File.dirname(__FILE__)
logfile = ::File.join(root,'logs','requests.log')

require 'logger'
class ::Logger; alias_method :write, :<<; end
logger  = ::Logger.new(logfile,'weekly')

use Rack::CommonLogger, logger

require ::File.join(root,'myapp')
#run MySinatraApp.new 

run MyApp
