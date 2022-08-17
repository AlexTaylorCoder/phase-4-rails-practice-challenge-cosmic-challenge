class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def show
        render json: find_scientist
    end

    def destroy
        find_scientist.destroy
        head :no_content
    end
    
    def index
        render json: Scientist.all
    end

    def create
        render json: Scientist.create!(permitted_params), status: 201
    end

    def update
        scientist = find_scientist
        scientist.update!(permitted_params)
        render json: scientist, status: 202
    end

    private

    def permitted_params
        params.permit(:name,:field_of_study,:avatar)
    end
    def find_scientist
        Scientist.find(params[:id])
    end

    def not_found
        render json: {error:"Scientist not found"}, status: 404
    end
end
