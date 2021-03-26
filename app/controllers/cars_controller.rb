class CarController < ApplicationController

    get '/cars' do
        @cars = Car.all
        erb :'cars/index'
    end

    get '/cars/:id' do
        @cars = Car.find_by(params[:id])
        erb :'cars/show'
    end
    #get '/c'

end