class ProfilesController < ApplicationController


	def show
		@profile = Profile.find(params[:id])
		@posts = @profile.user.posts.order("created_at DESC")
		@comment = Comment.new		
	end

	def edit
		@profile = current_user.profile
	end

	def update
		if set_profile.update_attributes(profile_params)
    		flash[:success] = "Your profile has been updated"
      		redirect_to set_profile
    	else
      		render 'edit'
    	end
	end

	private
	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:about_me, :location, :birthday, :avatar)
	end
end
