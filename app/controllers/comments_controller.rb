class CommentsController < ApplicationController

	before_filter :set_comment_params, :only => [:create]

	def create
		@comment = Comment.new(comment_params)	
		if @comment.save
			flash[:success] = 'Thanks for your comment!'
			redirect_to request.referrer
		else
			flash[:error] = "Sorry, your commentn didn't go through!"
			reciredt_to request.referrer
		end
	end


	def destroy
		@comment = Comment.find(params[:id])
		if @comment.delete
			flash[:success] = "Your embarrassing comment was deleted!"
			redirect_to request.referrer
		else
			flash[:error] = "Your comment was not deleted!"
			# QUESTION: Can you do this? Seems faulty.
			render request.referrer
		end
	end

private

	
	def comment_params
		params.require(:comment).permit(:content, :commentable_type, :commentable_id, :author_id)	
	end


	# Need to set the other params for the comment via params and session
	# QUESTION: THIS ALL SEEMS SMELLY, WHAT'S A BETTER WAY TO SET THESE?!
	def set_comment_params
		params[:comment][:commentable_type] = session[:referrer_controller].capitalize.singularize
		params[:comment][:commentable_id] = params[:referrer_id]
		params[:comment][:author_id] = @current_user.id
	end

end
