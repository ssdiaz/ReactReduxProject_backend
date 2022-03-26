class Api::V1::AttendeesController < ApplicationController
    before_action :set_trip

    def index
        attendees = @trip.attendees
        render json: attendees
    end

    def show
        attendee = @trip.attendees.find_by(id: params[:id]) || @trip.attendees.find_by(name: params[:name])

        render json: attendee
    end

    def create
        attendee = @trip.attendees.new(attendee_params)
        
        if attendee.save
            @trip.assign_bride(attendee)

            render json: @trip
        else
            render json: {error: 'Error in creating attendee. Please check fields.'}
        end
    end

    def update
        attendee = @trip.attendees.find_by(id: params[:id])

        attendee.update(attendee_params)
        if attendee.save
            render json: @trip
        else
            render json: {error: 'Error in editing attendee. Please check fields.'}
        end
    end


    def destroy
        attendee = @trip.attendees.find_by(id: params[:id])
        attendee.destroy

        render json: attendee
    end


    private

    def attendee_params
        params.require(:attendee).permit(:name, :phone, :status, :notes, :relationship, :lodgingBudget, :eventsBudget, :trip_id)
    end

    def set_trip
        @trip = Trip.find(params[:trip_id])
    end

end
