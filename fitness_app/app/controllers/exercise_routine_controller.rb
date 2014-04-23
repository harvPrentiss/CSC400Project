class ExerciseRoutineController < ApplicationController
	before_action :signed_in_user

	def create
		@data = params[:order].split(',')
		@routineID = @data.last
		@routine = Routines.find(@routineID)
		@data.remove(@data.length - 1)
		@data.each do |exID|
			@routine.exercise_routine.create(:exercise_id => exID)
		end
		current_user.follow!(@user)
		respond_to do |format|
			format.html {redirect_to @user}
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
