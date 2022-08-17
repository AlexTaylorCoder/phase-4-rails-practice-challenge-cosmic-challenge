class MissionsController < ApplicationController
    def create
        miss = Mission.create!(permitted_params)
        render json: Planet.find(params[:planet_id]), status: 201
    end

    private

    def permitted_params
        params.permit(:name,:planet_id,:scientist_id)
    end

end
