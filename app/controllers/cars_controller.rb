class CarController < ApplicationController

    get '/cars' do
        @cars = Car.all
        erb :'cars/index'
    end

    get '/cars/new' do
        erb :'/cars/new'
    end

    get '/cars/:id' do
        @cars = Car.find_by_id(params[:id])
        erb :'cars/show'
    end
    
    
    post '/cars' do
        car = Car.new(params["make"])

        if car.save
            redirect "cars/#{car.id}"
        else
            redirect "/cars/new"
        end
    end

    get '/cars/:id' do
        @car = Car.find_by_id(params[:id])
        erb :'cars/show'
    end

    patch '/cars/:id' do
        car = Car.find_by_id(params[:id])

        if car.update(params["car"])
            redirect "/cars#{car.id}"
        else
            redirect "/cars#{car.id}/edit"
        end
    end

    delete "/car/:id" do
        Car.find_by_id(params[:id])
        car.destroy
        redirect "/cars"
    end



end