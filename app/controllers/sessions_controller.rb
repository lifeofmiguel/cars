class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/new'
    end

    post '/login' do 
        user = User.find_by(email: params["user"]["email"])

        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            redirect "/movies"
        else
            redirect "/login"
    end

    delete '/logout' do
        session.delete("user_id")
        redirect "/login"
    end
end