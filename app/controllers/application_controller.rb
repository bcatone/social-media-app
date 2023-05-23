class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    before_action :authorized_user

    def current_user
        user = User.find_by(id: sessions[:user_id])
        user
    end

    def authorized_user
        render json: {errors: "Not authorized" }, syatus: :unauthorized unless current_user 
    end

    private

    def render_not_found_response(invalid)
        render json: { errors: "#{invalid.model} not found." }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
