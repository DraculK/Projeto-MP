
class Api::V1::SessionsController < ApplicationController
  def create
    user = User.new(user_params)
    user.admin = false
    user.save!
    begin
      head(:created)
    rescue StandardError => e
      head(:bad_request)
    end
  end

  def sign_in
    user = User.find_by(email: params[:email])
    
    if user.nil?
      head(:bad_request)
    else 
        if user.valid_password?(params[:password])
          render json: user.as_json(only: %i[name email])
        else
          head(:unauthorized)
      end
    end
  end

  def show
    user = User.find(params[:id])
    render json: user.as_json(only: %i[name email])
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :creator)
  end
end

