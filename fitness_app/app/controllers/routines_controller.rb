class RoutinesController < ApplicationController
	before_action :signed_in_user

	def index
		@routines = current_user.routines.paginate(page: params[:page], per_page: 15)
		@routine = current_user.routines.build
	end

	def create
		@routines = current_user.routines.paginate(page: params[:page], per_page: 15)
		@routine = current_user.routines.build(routine_params)
		store_location
		if @routine.save
			#successful save
			flash[:success] = "Routine saved successfully"
			redirect_back_or routines_path
		else
			# show errors and try again
			render :index
		end		
	end

	def destroy
		Routine.find(params[:id]).destroy
		flash[:success] = "Routine deleted."
		redirect_back_or routines_path
	end

	def edit
		@routine = Routine.find(params[:id])
		@user_exercises = current_user.exercises
		@routine_exercises = @routine.exercises
		respond_to do |format|
		  format.html
		  format.js
		end
	end



	private
  
  		def routine_params
  			params.require(:routine).permit(:R_title);
  		end


end