class Api::V1::TripsController < ApplicationController
    def index
        trips = Trip.all
        render json: trips
    end

    def show
        trip = Trip.find(params[:id])
        render json: trip
    end

    def create
        # binding.pry

        trip = Trip.new(trip_params)
        if trip.save
            render json: trip
        else
            render json: {error: 'Error in creating trip. Please check fields.'}
        end
    end

    def update
        trip = Trip.find(params[:id])

        trip.update(trip_params)
        if trip.save
            render json: trip
        else
            render json: {error: 'Error in editing trip. Please check fields.'}
        end
    end


    def destroy
        trip = Trip.find(params[:id])
        trip.destroy

        render json: trip
    end


    private

    def trip_params
        params.require(:trip).permit(:location, :start_date, :end_date)
    end

end
