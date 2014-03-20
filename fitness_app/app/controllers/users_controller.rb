class UsersController < ApplicationController

	before_action :signed_in_user, only: [:index, :edit, :update]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

	def index
		@users = User.paginate(page: params[:page])
	end
  
	def show
		@user = User.find(params[:id])
		@statuses = @user.statuses.paginate(page: params[:page])
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

	private
  
  		def user_params
  			params.require(:user).permit(:displayName, :emailAdd, :password, :password_confirmation, :profileImgURL, :heightM, :weightM, :bodyFatM, :armsM,
  				:forearmsM, :waistM, :chestM, :thighsM, :calvesM, :shouldersM, :neckM, :hideStats, :hideRoutines, :hideSoundtrack)
  		end

  		def correct_user
  			@user = User.find(params[:id])
  			redirect_to(root_url) unless current_user?(user)
  		end

  		def admin_user
  			redirect_to(root_url) unless current_user.admin?
  		end
end
