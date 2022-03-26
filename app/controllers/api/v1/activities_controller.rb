class Api::V1::ActivitiesController < ApplicationController
        before_action :set_trip

        def index
            activities = @trip.activities
            render json: activities

            # activities = Activity.all
            # render json: activities
        end
        
    
        def show
            activity = @trip.activities.find_by(id: params[:id])
            render json: activity
            # activity = Activity.find(params[:id])
            # render json: activity
        end
    
        def create
            activity = @trip.activities.new(activity_params)
            if activity.save
                # render json: activity
                render json: @trip
            else
                render json: {error: 'Error in creating activity. Please check fields.'}
            end
            # activity = Activity.new(activity_params)
            # if activity.save
            #     render json: activity
            # else
            #     render json: {error: 'Error in creating activity. Please check fields.'}
            # end
        end
    
        def update
            activity = @trip.activities.find_by(id: params[:id])
    
            activity.update(activity_params)
            if activity.save
                # render json: activity
                render json: @trip
            else
                render json: {error: 'Error in editing activity. Please check fields.'}
            end

        end

        def destroy
            # activity = Activity.find(params[:id])
            activity = @trip.activities.find_by(id: params[:id])
            activity.destroy

            render json: activity
        end
    
    
        private
    
        def activity_params
            params.require(:activity).permit(:name, :description, :cost, :mandatory, :priority, :includeInTotal, :comment, :day, :time, :trip_id)
        end
    
        def set_trip
            # @attendee = Attendee.find(params[:id])
            @trip = Trip.find(params[:trip_id])
        end
end
