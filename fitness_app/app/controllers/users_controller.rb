class UsersController < ApplicationController

	before_action :signed_in_user, only: [:index, :edit, :update]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

	def index
		@users = User.paginate(page: params[:page])
	end
  
	def show
		@user = User.find(params[:id])
		@status = current_user.statuses.build
		@statuses = current_user.feed.paginate(page: params[:page])
		@buddies = @user.followed_users
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#successful save
			sign_in @user
			flash[:success] = "Welcome to Pulse Fitness!"
			redirect_to @user
		else
			# show errors and try again
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_url
	end

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end

	private
  
  		def user_params
  			params.require(:user).permit(:displayName, :emailAdd, :password, :password_confirmation, :profileImgURL, :heightM, :weightM, :bodyFatM, :armsM,
  				:forearmsM, :waistM, :chestM, :thighsM, :calvesM, :shouldersM, :neckM, :hideStats, :hideRoutines, :hideSoundtrack, :song1, :song2, :song3,
  				:song4, :song5, :artist1, :artist2, :artist3, :artist4, :artist5)
  		end

  		def correct_user
  			@user = User.find(params[:id])
  			redirect_to(root_url) unless current_user?(@user)
  		end

  		def admin_user
  			redirect_to(root_url) unless current_user.admin?
  		end
end
