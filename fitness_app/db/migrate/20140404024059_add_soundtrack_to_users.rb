class AddSoundtrackToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :song1, :string
  	add_column :users, :song2, :string
  	add_column :users, :song3, :string
  	add_column :users, :song4, :string
  	add_column :users, :song5, :string

  	add_column :users, :artist1, :string
  	add_column :users, :artist2, :string
  	add_column :users, :artist3, :string
  	add_column :users, :artist4, :string
  	add_column :users, :artist5, :string
  end
end
