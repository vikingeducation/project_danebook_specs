require 'rails_helper'

describe "profiles/show.html.erb" do

	context 'with a signed in user' do
		
		let(:user){ create(:user) }

		before do
			

			# Setting our instance variables each time.
			assign(:user, user)
			assign(:current_user, user)
			assign(:profile, user.profile)

			# DUP 1
			def view.signed_in_user?
				true
			end


			@user = user
			def view.current_user
				@user
			end

			# NOTES: This was, unfortunately, the best way to make
			# this work since I use controller_name as a comparison
			# in some of my views.
			def view.controller_name
				"profiles"
			end
		end

		it 'shows the users name' do
			render
			expect(rendered).to match(@user.first_name)
		end

		it 'shows link to edit profile' do
			render
			expect(rendered).to match("<a .*>Edit Profile</a>")
		end

	end

end