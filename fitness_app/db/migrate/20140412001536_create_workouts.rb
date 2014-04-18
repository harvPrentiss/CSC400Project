class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.integer :routine_id
      t.integer :W_reps
      t.float :W_weight
      t.integer :W_sets
      t.float :W_distance
      t.time :W_time

      t.timestamps
    end
  end
end
