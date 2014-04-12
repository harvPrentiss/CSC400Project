class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.int :user_id
      t.string :R_title

      t.timestamps
    end
  end
end
