class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :session
        set :session_sectret, ENV["SESSION_SECRET"]
    end

    get '/' do 
        erb :index
    end
end