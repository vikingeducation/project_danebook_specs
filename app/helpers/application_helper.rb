module ApplicationHelper

	def check_login
		if current_user
			render 'shared/user_navbar'
		else
			render 'shared/home_navbar'
		end
	end

	def minutes_since_creation(object)
		end_of_minute(Time.now - object.created_at)
	end

	def date_in_words(date)
		date.to_date.to_formatted_s(:long_ordinal)
		# date.strftime("%B %%d, %Y")
	end

	def build_comment(type)
		type.comments.build
	end

	def current_user
    if @current_user
	  	@current_user
	  else
	    @current_user = User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
	  end
  end

  def current_user?
    params[:user_id] == current_user.id.to_s
  end

end
