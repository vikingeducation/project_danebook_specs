module LikesHelper


	# We want the link to display Like if the user has
	# not liked a post before and Unlike if the user HAS
	# liked a post before.
	def display_like_link(post)
		if post.liked_by?(@current_user)

			# .like_id is in post.rb and gives us the like_id of the like that
			# the @current_user controls on this particular post. We know that there is one
			# and only one becuase of the way we set up .liked_by?
			link_to "Unlike (#{post.likes.count})", like_path(post.like_id(@current_user)), method: :delete
		else 
			link_to "Like (#{post.likes.count})", likes_path(likeable_id: post.id, likeable_type: controller_name.titleize.singularize), method: :post
		end
		
	end


end
