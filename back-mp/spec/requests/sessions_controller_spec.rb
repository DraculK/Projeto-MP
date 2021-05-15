require 'rails_helper'

RSpec.describe Api::V1::SessionsController, :type => :controller do 
    #TESTE SHOW -----------------------------------
    context "#show" do
        let!(:user) {create(:user)}
        it "Should return an ok status" do 
            get :show, params: {id: user.id}
            expect(response).to have_http_status(:ok)
        end
    end

    #TESTE CREATE -----------------------------------
    context "#create" do
        let!(:params) {
            {email: "user@user.com", name: "user aa", password: "user123", password_confirmation:"user123", creator:false}
        }
        it "Success message, if everything is ok" do
            post :create, params: params
            expect(response).to have_http_status(:created)
        end
    end
end