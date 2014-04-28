class Exercise < ActiveRecord::Base
	belongs_to :user
	
	has_many :programs, dependent: :destroy
	has_many :routines, through: :programs
	has_many :workouts, dependent: :destroy
	
	validates :user_id, presence: true
	validates :E_title, presence: true, length: {maximum: 20}
	validates :E_type, presence: true, length: {maximum: 20}


	def self.part_of(routine)
		exercise_list = "SELECT exercise_id FROM exercise_routines WHERE routine_id = :routine_id" 
		where("exercise_id IN (#{exercise_list})")
	end
	
end
