class CreateExerciseRoutines < ActiveRecord::Migration
  def change
    create_table :exercise_routines do |t|
      t.integer :exercise_id
      t.integer :routine_id

      t.timestamps
    end

    add_index :exercise_routines, :exercise_id
    add_index :exercise_routines, :routine_id
    add_index :exercise_routines, [:exercise_id, :routine_id], unique: true

  end
end
