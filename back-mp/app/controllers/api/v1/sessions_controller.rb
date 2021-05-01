class Api::V1::SessionsController < ApplicationController
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
end

