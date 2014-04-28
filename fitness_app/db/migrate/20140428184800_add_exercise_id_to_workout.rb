class AddExerciseIdToWorkout < ActiveRecord::Migration
  def change
  	add_column :workouts, :exercise_id, :integer
  	remove_column :workouts, :routine_id
  end
end
