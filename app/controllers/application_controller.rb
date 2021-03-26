#require '/config/environment'
class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :session
        set :session_secret, ENV["SESSION_SECRET"]
    end

    get '/' do 
        erb :search
    end

    get '/search' do 
        @car = Car.find_by(model: params["model"])
        erb :results
    end
end