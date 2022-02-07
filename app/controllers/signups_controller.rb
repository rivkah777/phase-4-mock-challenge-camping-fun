class SignupsController < ApplicationController
    rescue_from  ActiveRecord::RecordInvalid, with: :render_not_bueno 

    def create 
        signup = Signup.create!(signup_params)
        render json: signup, status :created
    end 

    private 

    def signup_params
        params.permit(:camper, :activity, :time)
    end 

    def render_not_bueno
        render json {"errors": "validation errors"}, status: :unprocessable_entity
    end

end
