require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { User.create!({username: "jill_bruce", password: "password"}) }

  describe "GET #new" do
    it "renders the sign up page" do
      # this line simulates a "GET" request to the LinksController that hits the #new method, passing in `{link: {}}` as params.
      get :new

    # here we check to make sure that the response renders back the new template
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "logs in the user on submit" do
      post :create, user: {username: "jill_bruce",password:"password"}
      expect(response).to redirect_to user_url(User.last)
  end
end

end
