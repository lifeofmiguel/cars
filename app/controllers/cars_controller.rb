class CarsController < ApplicationController
    get '/cars' do
        @cars = Cars.all
        erb :'index'
    end

end