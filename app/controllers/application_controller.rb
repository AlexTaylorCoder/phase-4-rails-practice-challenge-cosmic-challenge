class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
rescue_from ActiveRecord::RecordNotFound, with: :not_found

private

    def invalid_record invalid
        render json: {errors:invalid.record.errors.full_messages}, status: 422
    end

    def not_found invalid
        render json: {errors:invalid}, status: 404
    end
end
