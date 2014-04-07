class AddSoundtrackToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :song1, :string, default: ''
  	add_column :users, :song2, :string, default: ''
  	add_column :users, :song3, :string, default: ''
  	add_column :users, :song4, :string, default: ''
  	add_column :users, :song5, :string, default: ''

  	add_column :users, :artist1, :string, default: ''
  	add_column :users, :artist2, :string, default: ''
  	add_column :users, :artist3, :string, default: ''
  	add_column :users, :artist4, :string, default: ''
  	add_column :users, :artist5, :string, default: ''
  end
end
