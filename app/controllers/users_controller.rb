class UsersController < ApplicationController

    def index
        render json: User.all, status: :ok
    end

    def show
        render json: User.find(params[:id]), status: :ok
    end

    def create
        render json: User.create!(user_params), status: :created
    end

    def destroy
    # include password check when auth is set up
        user = User.find(params[:id])
        user.destroy!
        head: no_content
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :phone_number, :first_name, :middle_name, :last_name, :date_of_birth, :gender, :pronouns, :city, :state, :zip_code, :country)
    end
end
