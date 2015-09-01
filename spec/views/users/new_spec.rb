require 'rails_helper'

describe "users/new.html.erb" do

	context 'with a signed in user' do
		
		let(:user){ create(:user) }

		before do
			def view.signed_in_user?
				true
			end

			@user = user
			def view.current_user
				@user
			end
		end

		it 'shows the users name' do
			assign(:user, user)
			assign(:current_user, user)
			binding.pry
			render
		end

	end

end