class UsersController < ApplicationController
	
	# TODO: Redirect user to homepage if not 
	# logged in viewing profiles

	skip_before_filter :must_be_signed_in, :only => [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.birthday = convert_birthday(params)
		if @user.save
			flash[:success] = "User created successfully!"
			sign_in(@user)
			
			# Once the user is created we'll want to create a blank
			# profile for them.
			Profile.create(:user_id => @user.id)
			
			# TODO: Redirect to profile_path
			redirect_to root_url
		else
			flash[:error] = "Failed to create user"
			render :new
		end
	end


private

	def user_params
		params.require(:user).
					permit(:first_name,
									:last_name, 
									:email, 
									:password,
									:password_confirmation,
									:birthday_year,
									:birthday_month,
									:birthday_day,
									:gender
					)
	end

	# Convert birthday into a meaningful date from the form.
	def convert_birthday(params)
		if params[:birthday_year].empty? || params[:birthday_month].empty? || params[:birthday_day].empty?
			nil
		else
			Date.parse("#{params[:birthday_year]}-#{params[:birthday_month]}-#{params[:birthday_day]}")
		end
	end

end