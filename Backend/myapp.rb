class MyApp < Sinatra::Base

  set :root, '/Users/etayluz/ParkSwap/Backend'
  register(Sinatra::Logger)

  get '/' do
    logger.error("some informative message goes here")
    'Hello world!'
  end

  post '/form' do  
    "You said '#{params[:message]}'"  
  end

  get '/hello/:name' do  
    params[:name]  
  end 
end


