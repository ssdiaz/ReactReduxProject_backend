class Api::V1::AttendeesController < ApplicationController
    # before_action :set_attendee

    def index
        attendees = Attendee.all
        render json: attendees
    end

    def show
        attendee = Attendee.find(params[:id])
        render json: attendee
    end

    def create
        # binding.pry

        attendee = Attendee.new(attendee_params)
        if attendee.save
            render json: attendee
        else
            render jason: {error: 'Error in creating attendee. Please check fields.'}
        end
    end


    def destroy
        attendee = Attendee.find(params[:id])
        attendee.destroy
    end


    private

    def attendee_params
        params.require(:attendee).permit(:name, :phone, :status, :notes, :relationship, :lodgingBudget, :eventsBudget)
    end

    # def set_attendee
        # @attendee = Attendee.find(params[:id])
    # end

end
