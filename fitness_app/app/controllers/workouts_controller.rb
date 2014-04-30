class WorkoutsController < ApplicationController
	before_action :signed_in_user

	def create
		@workout = Workout.new(workout_params)
		store_location
		if @workout.save
			flash[:success] = "Workout logged"
			@exercise = Exercise.find(workout_params['exercise_id'])
			@exercise.workouts << @workout
			@exercise.save
			redirect_back_or routines_path
		end
	end



	def workout_params
  		params.require(:workout).permit(:exercise_id, :userID, :W_reps, :W_weight, :W_sets, :W_distance, :W_time, :notes);
  	end
end