class CampersController < ApplicationController

    # fetching 
    def index
        campers = Camper.all
    
        render json: campers, only: [:id, :name, :age]
    end

    # showing a single user 
    def show
        camper = Camper.find_by(id: params[:id])
    
        if camper
          render json: camper, only: [:id, :name, :age], include: { activities: { only: [:id, :name, :difficulty] } }
        else
          render json: { error: "Camper not found" }, status: :not_found
        end
      end

    #   creating a new user
    def create
        camper = Camper.new(camper_params)
    
        if camper.save
          render json: camper, status: :created, only: [:id, :name, :age]
        else
          render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
      private
    
      def camper_params
        params.permit(:name, :age)
      end

end
