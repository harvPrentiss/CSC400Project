class Exercise < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :E_title, presence: true, length: {maximum: 20}
	validates :E_type, presence: true, length: {maximum: 20}


	def self.exercises_of(user)
		exercise_ids = "SELECT exercise_id FROM exercises
							 WHERE user_id = :user_id"
	end
end
