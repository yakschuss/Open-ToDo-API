require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let(:my_user) { create(:user) }


  context "unauthenticated users" do
    it "GET index returns http unauthenticated" do
      get :index
      expect(response).to have_http_status(401)
    end

  end

  context "authenticated and authorized users" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end

    describe "GET index" do
      before { get :index }

        it "returns http success" do
          expect(response).to have_http_status(:success)
        end


        it "returns json content type" do
          expect(response.content_type).to eq("application/json")
        end

      end



     describe "POST create" do
       context "with valid attributes" do
         before do

           @new_user = build(:user)
           post :create, user: { id: @new_user.id, created_at: @new_user.created_at}
         end


         it "returns http success" do
           expect(response).to have_http_status(:success)
         end

         it "returns json content type" do
           expect(response.content_type).to eq 'application/json'
         end

         it "creates a user with the correct attributes" do
           hashed_json = JSON.parse(response.body)
           expect(hashed_json["id"]).to eq(@new_user.id)
           expect(hashed_json["created_at"]).to eq(@new_user.created_at)

         end
       end
     end
  end
end
