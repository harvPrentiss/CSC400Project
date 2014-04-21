class ExerciseRoutine < ActiveRecord::Base
	belongs_to :exercise
	belongs_to :routine

	validates :exercise_id, presence: true
	validates :routine_id, presence: true
end
