class CamperActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :bad

def create
    camper_activity = CamperActivity.create!(activity_params)
    render json: camper_activity.activity, status: :created
end

private

def activity_params
    params.permit(:camper_id,:activity_id )
end

def bad (e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end

end
