class Api::V1::ActivitiesController < ApplicationController
        # before_action :set_activity

        def index
            activities = Activity.all
            render json: activities
        end
    
        def show
            activity = Activity.find(params[:id])
            render json: activity
        end
    
        def create
            activity = Activity.new(activity_params)
            if activity.save
                render json: activity
            else
                render json: {error: 'Error in creating activity. Please check fields.'}
            end
        end
    
    
        def destroy
            activity = Activity.find(params[:id])
            activity.destroy

            render json: activity
        end
    
    
        private
    
        def activity_params
            params.require(:activity).permit(:name, :description, :cost, :mandatory, :priority, :includeInTotal, :comment, :day, :time)
        end
    
        # def set_activity
        #     @activity = Activity.find(params[:id])
        # end
end
