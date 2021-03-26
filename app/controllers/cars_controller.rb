class CarsController < ApplicationController
    get '/cars' do
        @cars = Cars.all
        erb :'index'
    end

    get '/cars/:id' do
        @cars = Car.find_by(params[:id])
        erb :'cars/show'
    end
    #get '/c'

end