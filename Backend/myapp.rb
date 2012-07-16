class MyApp < Sinatra::Base

  set :root, '/Users/etayluz/ParkSwap/Backend'
  register(Sinatra::Logger)

  get '/' do
    logger.error("Main page21")
    'Hello world!'
  end

  post '/form' do  
    #logger.error("Form page: #{params.inspect}")
    puts "latitude: " + params[:latitude] + " longitude: " + params[:longitude]
  end

  get '/hello/:name' do  
    params[:name]  
    logger.error("Hello page")
  end 
end


