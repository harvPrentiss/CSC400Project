class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :routine_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
