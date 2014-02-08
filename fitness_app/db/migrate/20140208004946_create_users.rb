class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :displayName
      t.string :password
      t.string :emailAdd
      t.string :profileImgURL
      t.int :heightM
      t.int :weightM
      t.int :bodyFatM
      t.int :armsM
      t.int :forearmsM
      t.int :waistM
      t.int :chestM
      t.int :thighsM
      t.int :calvesM
      t.int :shouldersM
      t.int :neckM
      t.boolean :hideStats
      t.boolean :hideRoutines
      t.boolean :hideSoundtrack

      t.timestamps
    end
  end
end
