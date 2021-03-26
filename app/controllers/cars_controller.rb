class CarController < ApplicationController

    get '/cars' do
        @cars = Car.all
        erb :'cars/index'
    end

    get '/cars/new' do
        erb :'/cars/new'
    end

    get '/cars/:id' do
        @cars = Car.find_by(params[:id])
        erb :'cars/show'
    end
    
    
    post '/cars' do
    end

end