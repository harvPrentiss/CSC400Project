class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(emailAdd: params[:session][:emailAdd].downcase)
		if user && user.authenticate(params[:session][:password])
			#sign in and redirect
			sign_in user
			redirect_back_or user
		else
			# error and try again
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
