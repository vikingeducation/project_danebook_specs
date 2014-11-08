require 'rails_helper'
require 'pry'

# Here, we're explicitly calling the `describe` block
# on RSpec and also explicitly letting RSpec know
# that this is a Model spec, so it should include
# some extra model helper methods
# This is the explicit way to specify a model spec
# which we might otherwise implicitly set up using
# `describe User do` and relying on file naming conventions
# to handle classifying it as a model spec
RSpec.describe User, :type => :model do

  let(:user) { build(:user) }

  context 'when user signs up' do
    it "should save with valid attributes" do
      expect{user.save!}.not_to raise_error
    end

    context "should fail to save" do
      specify "if email is blank" do
        expect{build(:user, email: nil).save!}.to raise_error
      end

      specify "if email is taken" do
        build(:user, email: "a@b.c").save!
        expect {build(:user, email: "a@b.c").save!}.to raise_error
      end

      specify "if password is blank" do
        expect{build(:user, password: nil).save!}.to raise_error
      end

      specify "if password is too short" do
        expect{build(:user, password: "pass").save!}.to raise_error
      end

      specify "if gender is blank" do
        expect{build(:user, gender: nil).save!}.to raise_error
      end

      specify "if birthday is blank" do
        expect{build(:user, birthday: nil).save!}.to raise_error
      end
    end

    context "should respond to association" do
      specify "profile" do
        expect(user).to respond_to(:profile)
      end

      specify "posts" do
        expect(user).to respond_to(:posts)
      end

      specify "comments" do
        expect(user).to respond_to(:comments)
      end

      specify "likes" do
        expect(user).to respond_to(:likes)
      end

      specify "friended users" do
        expect(user).to respond_to(:friended_users)
      end

      specify "users friended by" do
        expect(user).to respond_to(:users_friended_by)
      end

      specify "photos" do
        expect(user).to respond_to(:photos)
      end
    end

    it "should generate auth token"
    it "should regenerate auth token uniquely"
  end

end