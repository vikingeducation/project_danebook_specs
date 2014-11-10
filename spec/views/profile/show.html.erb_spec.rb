require 'rails_helper'

RSpec.describe "profiles/show.html.erb", :type => :view do

  before do
  	@user = create(:user)
  	@other_user = create(:user)
  	@profile = @user.build_profile
  	allow(view).to receive(:current_user).and_return(@user)
  end

  it "should show the User's information" do
    render
  	expect(rendered).to match /About/
  end

  context "edit profile button" do

  	context "current user is on their own show page" do

  		it "should render the edit profile button" do
  			render
  			expect(rendered).to match /Edit profile/
  		end

  	end

  	context "current user is on other's show page" do

  		it "should not display edit profile button" do
  			allow(view).to receive(:current_user).and_return(@other_user)
  			render
  			expect(rendered).not_to match /Edit profile/
  		end

  	end
  end
end
