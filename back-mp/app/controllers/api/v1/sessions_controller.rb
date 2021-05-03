module Api
  module V1
    class SessionsController < ApplicationController
      def sign_in
        user = User.find_by(email: params[:email])

        if user.nil?
          head(:bad_request)
        elsif user.valid_password?(params[:password])
          render json: user.as_json(only: %i[name email])
        else
          head(:unauthorized)
        end
      end
    end
  end
end
