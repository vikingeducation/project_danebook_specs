require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe 'POST #create' do

    let(:user){create(:user)}

    it "should find user by email" do
      post :create, email: user.email, password: "verysecure"
      expect(assigns(:user).email).to eq(user.email)
    end

    context 'successful sign in' do
      it "should redirect to the user's profile" do
        post :create, email: user.email, password: "verysecure"
        expect(response).to redirect_to user_profile_path(user)
      end

      specify "with remember me" do
        expect(subject).to receive(:permanent_sign_in)
        post :create, email: user.email, password: "verysecure", remember_me: true
      end

      specify "without remember me" do
        expect(subject).to receive(:sign_in)
        post :create, email: user.email, password: "verysecure", remember_me: false
      end

    end

    context 'unsuccessful sign in' do

      it "should re-render with errors" do
        post :create, email: user.email, password: "notsecure"
        expect(response).to render_template 'users/new'
      end

    end
  end
end
