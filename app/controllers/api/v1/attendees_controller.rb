class Api::V1::AttendeesController < ApplicationController
    before_action :set_trip

    def index
        attendees = @trip.attendees
        render json: attendees
        # attendees = Attendee.all
        # render json: attendees
        # /api/trips/1/attendees
    end

    def show
        attendee = @trip.attendees.find_by(id: params[:id])
        # attendee = Attendee.find(params[:id])
        render json: attendee
        # attendee = Attendee.find(params[:id])
        # render json: attendee
    end

    def create
        # binding.pry
        attendee = @trip.attendees.new(attendee_params) #use build
        
        if attendee.save
            @trip.assign_bride(attendee)
            #@trip.save
            render json: @trip
            # render json: attendee #MADE THE CHANGE HERE!
        else
            render json: {error: 'Error in creating attendee. Please check fields.'}
        end

        # attendee = Attendee.new(attendee_params)

        # if attendee.save
        #     render json: attendee
        # else
        #     render json: {error: 'Error in creating attendee. Please check fields.'}
        # end
    end

    def update
        attendee = @trip.attendees.find_by(id: params[:id])

        attendee.update(attendee_params)
        if attendee.save
            render json: attendee
        else
            render json: {error: 'Error in editing attendee. Please check fields.'}
        end
        # attendee = Attendee.find(params[:id])

        # attendee.update(attendee_params)
        # if attendee.save
        #     render json: attendee
        # else
        #     render json: {error: 'Error in editing attendee. Please check fields.'}
        # end
    end


    def destroy
        # attendee = Attendee.find(params[:id])
        attendee = @trip.attendees.find_by(id: params[:id])
        attendee.destroy

        render json: attendee
    end


    private

    def attendee_params
        params.require(:attendee).permit(:name, :phone, :status, :notes, :relationship, :lodgingBudget, :eventsBudget, :trip_id)
    end

    def set_trip
        # @attendee = Attendee.find(params[:id])
        @trip = Trip.find(params[:trip_id])
    end

end
