class SessionsController < ApplicationController

    get '/login' do
        redirect_if_logged_in
        erb :'sessions/new'
    end

    post '/login' do 
        redirect_if_logged_in
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