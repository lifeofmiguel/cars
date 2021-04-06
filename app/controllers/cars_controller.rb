class CarController < ApplicationController

    get '/cars' do
        
        @cars = Car.all
        #redirect "/login" if :logged_in?
        
        erb :'cars/index'
    end

    get '/cars/new' do
        redirect "/login" if !logged_in?
        erb :'/cars/new'
    end

    get '/cars/:id' do
        
        redirect "/login" if !logged_in?
        @car = Car.find_by_id(params[:id])
        erb :'cars/show'
    end
    
    
    post '/cars/new' do
        redirect "/login" if !logged_in?

        car = Car.new( make: params[:car][:make], model: params[:car][:model], desc: params[:car][:desc])
        if car.save
            redirect "/cars"
        else
            flash[:error] = "#{car.errors.full_messages.join(",")}"
            redirect "/cars/new"
        end
    end

    get '/cars/:id/edit' do
        redirect "/login" if !logged_in?
        @car = Car.find_by_id(params[:id])
        erb :'cars/edit'
    end

    patch '/cars/:id' do
        redirect "/login" if !logged_in?
        @car = Car.find_by_id(params[:id])

        if @car.update(params["car"])
            redirect "/cars/#{@car.id}"
        else
            redirect "/cars/#{@car.id}/edit"
        end
    end

    delete "/cars/:id" do
        redirect "/login" if !logged_in?
        @car = Car.find_by_id(params[:id])
        @car.destroy
        redirect "/cars"
    end

    private

    def redirect_if_not_authorized
        @car = Car.find_by_id(params[:id])
        if @car.user_id != session["user_id"]
            redirect "/cars"
        end
    end
end