class ExerciseRoutineController < ApplicationController
	before_action :signed_in_user

	def create
		@routine = Routine.find(params[:exercise_routine][:routine_id])
		@exercise = Exercise.find(params[:exercise_routine][:exercise_id])
		@routine.add_exercise!(@exercise)
		respond_to do |format|
			format.html {redirect_to @routine}
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end
	end
end
