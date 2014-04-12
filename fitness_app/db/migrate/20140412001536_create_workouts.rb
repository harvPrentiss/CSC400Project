class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.int :user_id
      t.int :routine_id
      t.int :W_reps
      t.float :W_weight
      t.int :W_sets
      t.float :W_distance
      t.time :W_time

      t.timestamps
    end
  end
end
