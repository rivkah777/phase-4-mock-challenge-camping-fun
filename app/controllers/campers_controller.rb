class CampersController < ApplicationController
    rescue_from  ActiveRecord::RecordNotFound, with: :whoops
    rescue_from  ActiveRecord::RecordInvalid, with: :render_not_bad 
    

    
        



    def index 
        render json: Camper.all, status: :ok
    end 


    def show 
        render json: find_camper, status: :ok,
        serializer: CamperActivitiesSerializer
    end 

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end 

    private 

    def find_camper 
        Camper.find(params[:id])
    end 
     
    def whoops
        render json: {"error": "Camper not found"}, status: :not_found
    end
    
    def camper_params
        params.permit(:name, :age)
    end

    def render_not_bad
        render json: {"errors": "validation errors"}, status: :unprocessable_entity
    end
end
