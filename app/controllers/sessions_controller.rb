class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/new'
    end

    post '/login' do 
    end

    delete '/logout' do
    end
end