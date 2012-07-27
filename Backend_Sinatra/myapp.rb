#DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/ex1.db")
DataMapper.setup :default, "sqlite://#{Dir.pwd}/ex2.db"
DataMapper.auto_migrate! 
class User  
    include DataMapper::Resource  
      
    property :id       , Serial  
    property :username , String  
    #property :email    , String  
end  

DataMapper.finalize

class MyApp < Sinatra::Base

  set :root, '/Users/eluz/ParkSwap/Backend'
  register(Sinatra::Logger)

  get '/' do
    logger.error("Main page21")
    'Hello world!'
  end

  post '/form' do  
    logger.error("Form page: #{params.inspect}")
    puts "latitude: " + params[:latitude] + " longitude: " + params[:longitude]
    #user = User.new username: "JoeSchmo", email: "joe@schmo.com"
    #user.save

    #user.errors.each do |error|  
    #  puts error  
    #end 

    User.create username: "Etay"
    #User.create id: "1", username: "JoeSchmo", email: "joe@schmo.com"
    puts User.get(1) 
  end

  get '/hello/:name' do  
    params[:name]  
    logger.error("Hello page")
  end 
end


