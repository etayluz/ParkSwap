class MyApp < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  post '/form' do  
    "You said '#{params[:message]}'"  
  end

  get '/hello/:name' do  
    params[:name]  
  end 
end


