class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/new'
    end

    post '/login' do 
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/cars'
        else
            redirect '/login'
        end
    end

    delete '/logout' do
        session.delete("user_id")
        redirect '/login'
    end
end