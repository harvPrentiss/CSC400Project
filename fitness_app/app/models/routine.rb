class Routine < ActiveRecord::Base
	belongs_to :user
	
	has_many :programs, dependent: :destroy
	has_many :exercises, through: :programs
	has_many :workouts, dependent: :destroy

	validates :R_title, presence: true, uniqueness: { case_sensitive: false}

	def exercise_list
		Exercise.part_of(self)
	end
end
