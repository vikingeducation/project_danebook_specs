class PostsController < ApplicationController

	def show
		@profile = Profile.find(params[:profile_id])
		@user = @profile.user
		@post = Post.new
	end

	def create
		@post = @current_user.posts.build(post_params)

		if @post.save
			flash[:success] = "Post created successfully!"
			redirect_to profile_posts_path(@current_user.profile)
		else
			flash[:error] = "Error creating post"
			render :show
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:success] = "Post deleted successfully!"
			redirect_to profile_path(@post.profile)
		else
			flash[:error] = "Post unable to be deleted"
			render :show
		end
		
	end


private
	
	def post_params
		params.require(:post).permit(:content)
	end
end
