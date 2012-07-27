require 'rubygems'
require 'sinatra'
require 'sinatra/logger'
set :root, '/Users/eluz/ParkSwap/Backend'
require 'bundler'
Bundler.require
require 'data_mapper'


require './myapp'

#DataMapper.setup(:default, 'postgres://user:password@hostname/database')
#DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/ex1.db")

root = ::File.dirname(__FILE__)
logfile = ::File.join(root,'logs','requests.log')

require 'logger'
class ::Logger; alias_method :write, :<<; end
logger  = ::Logger.new(logfile,'weekly')

use Rack::CommonLogger, logger

require ::File.join(root,'myapp')
#run MySinatraApp.new 

run MyApp
