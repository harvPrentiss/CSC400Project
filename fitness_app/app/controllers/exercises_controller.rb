class ExercisesController < ApplicationController
	before_action :signed_in_user

	def index
		@exercises = current_user.exercises.paginate(page: params[:page], per_page: 15)
		@exercise = current_user.exercises.build
	end

	def create
		@exercise = current_user.exercises.build(exercise_params)
		store_location
		if @exercise.save
			#successful save
			flash[:success] = "Exercise saved successfully"
			redirect_back_or exercises_path
		else
			# show errors and try again
			render :index
		end		
	end

	def destroy
		Exercise.find(params[:id]).destroy
		flash[:success] = "Exercise deleted."
		redirect_back_or exercises_path
	end



	private
  
  		def exercise_params
  			params.require(:exercise).permit(:E_title, :E_type);
  		end


end