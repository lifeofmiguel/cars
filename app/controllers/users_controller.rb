class UsersController < ApplicationController

    get '/signup' do
        erb :'users/new'
    end

    # post '/signup'do
    #     user = User.new(params["user"])
    #     if user.save
    #         session["user_id"] = user.id
    #         redirect "/cars"
    #     else
    #         redirect "signup"
    #     end
    # end

    post '/signup' do
        @user = User.new(email: params[:email], password: params[:password])
        if @user.save
            redirect '/login'
        else
           redirect '/signup'
        end
    end
end