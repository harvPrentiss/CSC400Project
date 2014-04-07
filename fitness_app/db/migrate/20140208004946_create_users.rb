class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :displayName
      t.string :password
      t.string :emailAdd
      t.string :profileImgURL
      t.integer :heightM
      t.integer :weightM
      t.integer :bodyFatM
      t.integer :armsM
      t.integer :forearmsM
      t.integer :waistM
      t.integer :chestM
      t.integer :thighsM
      t.integer :calvesM
      t.integer :shouldersM
      t.integer :neckM
      t.boolean :hideStats
      t.boolean :hideWorkouts
      t.boolean :hideSoundtrack

      t.timestamps
    end
  end
end
