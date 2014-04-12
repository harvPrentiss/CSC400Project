class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.int :user_id
      t.string :E_title
      t.string :E_type

      t.timestamps
    end
  end
end
