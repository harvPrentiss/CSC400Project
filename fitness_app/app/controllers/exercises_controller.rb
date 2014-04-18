class ExercisesController < ApplicationController
	before_action :signed_in_user

	def index
		@exercises = current_user.exercise_list.paginate(page: params[:page], per_page: 15)
	end

	def create
		@user = User.find(params[:id])
		@exercise = Exercise.new(exercise_params(@user.id))
		if @exercise.save
			#successful save
			flash[:success] = "Exercise saved successfully"
			redirect_to @user
		else
			# show errors and try again
			render 'new'
		end		
	end

	def destroy
		Exercise.find(params[:id]).destroy
		flash[:success] = "Exercise deleted."
		redirect_to users_url
	end



	private
  
  		def exercise_params(user)
  			params.require(user, :E_title, :E_type)
  		end


end