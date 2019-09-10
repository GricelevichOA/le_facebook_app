class PostsController < ApplicationController

	def index
		@post = Post.new
		@posts = Post.all		
	end

	def show
		set_post
	end

	def new
		@post = Post.new
	end

	def create
    @post = current_user.posts.build(post_params)
	    if @post.save
	      flash[:post_success] = 'Post successful!'
	      redirect_to root_url
	    else
	      flash[:post_failure] = 'Post did not save - text content required.'
	      redirect_to root_url
	    end
	end

	def edit
		set_post		
	end

	def update
		if set_post.update_attributes(post_params)
			flash[:success] = "Post updated!"
			redirect_to post_path
		else
			render 'edit'
		end		
	end

	def destroy
		set_post.destroy
		flash[:success] = "Post was deleted."
		redirect_to root_path
	end

	private
	def set_post
		@post = Post.find(params[:id])		
	end

	def post_params
		params.require(:post).permit(:content)		
	end

end
