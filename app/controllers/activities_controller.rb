class ActivitiesController < ApplicationController
    rescue_from  ActiveRecord::RecordNotFound, with: :ups

    def index 
        render json: Activity.all, status: :ok
    end 


    def destroy
        activity = find_activity
        activity.destroy 
        head :no_content, status: :ok
    end 

    private 

    def find_activity
        Activity.find(params[:id])
    end 

    def ups
        render json: {"error": "Activity not found"}, status: :not_found
    end
end
