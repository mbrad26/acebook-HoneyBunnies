require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:invalid_params) { { fname: "Will", lname: "Man", email: "will@man.com", password: "123", password_confirmation: "123" } }
  let(:valid_session) { {} }
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create", type: :controller do

    context "when invalid params" do
      it "redirects to root page" do
        post :create, params: { user: invalid_params }, session: valid_session

        expect(response.location).to eq "http://test.host/"
      end
    end
  end

  # describe "PATCH #update" do

  #   context "when invalid params" do
  #     it "redirects to edit page" do
  #       User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')
  #       user = User.find_by(email: 'john.doe@example.com')
  #       p '****************'
  #       p user.id
  #       p session[:user_id]
  #       patch :update, id: "#{user.id}", params: { user: invalid_params }, session: valid_session

  #       expect(response.location).to eq "http://test.host/users/#{user.id}/edit"
  #       # expect(response.location).to eq "http://test.host/sessions/new"
  #     end
  #   end
  # end

end
