class RelationshipsController < ApplicationController
	before_action :signed_in_user

	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		respond_to do |format| #only 1 line executed depending on req type
			format.html { redirect_to @user } 
			format.js	#calls file create.js.erb upon Ajax request [11.38]
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

end