class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :emailAdd, unique: true
  end
end
