class UsersController < ApplicationController
  
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#successful save
			flash[:success] = "Welcome to Pulse Fitness!"
			redirect_to @user
		else
			# show errors and try again
			render 'new'
		end
	end

	private
  
  		def user_params
  			params.require(:user).permit(:displayName, :emailAdd, :password, :password_confirmation)
  		end
end
