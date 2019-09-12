class CommentsController < ApplicationController
	before_action :comment_owner_check, only: [:edit, :update, :destroy]
	
	def create
		@comment = current_user.comments.build(comment_params)
	    if @comment.save
	      flash[:success] = 'Comment created'
	      redirect_to Post.find(@comment.post_id)
	    else
	      flash[:danger] = 'Something is wrong. Comment not created'
	      redirect_to root_url
	    end
	end

	def edit
		set_comment
	end

	def update
		if set_comment.update_attributes(comment_params)
			flash[:success] = "Comment updated!"
			redirect_to Post.find(comment.post_id)
		else
			render 'edit'
		end	
	end

	def destroy
		set_comment.destroy
		flash[:success] = "Comment was deleted."
		redirect_to root_path		
	end


	private
	def set_comment
		@comment = Comment.find(params[:id])		
	end

	def comment_params
		params.require(:comment).permit(:content, :post_id)		
	end

	def comment_owner_check
	    @user = set_comment.user
	    redirect_to(root_url) unless @user == current_user
  	end
end
