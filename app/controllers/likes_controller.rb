class LikesController < ApplicationController


	def destroy
		@like = Like.find(params[:id])
		if @like.delete
			flash[:success] = "Unliked!"
			redirect_to request.referer	
		else
			flash[:error] = "Couldn't unlike this!"
			redirect_to request.referer
		end	
	end


	def create
		# Make a new like with the proper information
		params[:like] = {:likeable_id => params[:likeable_id], :likeable_type => params[:likeable_type]} 
		@like = @current_user.likes.new(like_params)	
		if @like.save
			flash[:success] = "Liked!"

			# QUESTION: This feels a little smelly, is there a better way to make
			# this generic? I want to redirect back to the show page of the likeable_type 
			# associated with this like, passing it the @like.profile since that's what
			# these will all be found under. Seems too complicated.
			# UPDATE: so I got rid of it and just return to the referer
			# like_parent = @like.likeable_type.constantize.find(@like.likeable_id)
			redirect_to request.referer
		else
			flash[:error] = "There was an error with your like!"
			render :show
		end
	end

private

	def like_params
		params.require(:like).
						permit(:likeable_id, 
									 :likeable_type)
	end
end
