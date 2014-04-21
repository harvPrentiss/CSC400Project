class Routine < ActiveRecord::Base
	belongs_to :user
	belongs_to :routine
	validates :user_id, presence: true
	validates :E_title, presence: true, length: {maximum: 20}
	validates :E_type, presence: true, length: {maximum: 20}



	
end
