class PostsController < ApplicationController

	def show
		@user = User.find(params[:id])
		@profile = @user.profile
		@post = Post.new
	end

	def create
		@post = @current_user.posts.build(post_params)

		if @post.save
			flash[:success] = "Post created successfully!"
			redirect_to post_path(@current_user.id)
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
