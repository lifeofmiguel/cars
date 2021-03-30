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

    helpers do 
        def current_user
            @current_user ||=User.find_by_id(session["user_id"])
        end

        def logged_in?
            !!current_user
        end

        def redirect_if_not_logged_in
            redirect "/login" if !logged_in?
        end

        def redirect_if_logged_in
            redirect "/cars" if !logged_in?
        end
    end

end