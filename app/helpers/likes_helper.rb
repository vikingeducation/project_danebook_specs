module LikesHelper


	# We want the link to display Like if the user has
	# not liked a post before and Unlike if the user HAS
	# liked a post before. We use the 'model' here because
	# this might not be a post, other things can be liked
	# as well (such as comments).
	def display_like_link(model)
		if model.liked_by?(@current_user)

			# .like_id is in post.rb and gives us the like_id of the like that
			# the @current_user controls on this particular post. We know that there is one
			# and only one becuase of the way we set up .liked_by?
			link_to "Unlike (#{model.likes.count})", like_path(model.like_id(@current_user)), method: :delete
		else
			link_to "Like (#{model.likes.count})", likes_path(likeable_id: model.id, likeable_type: model.class.name), method: :post
		end
		
	end


end
