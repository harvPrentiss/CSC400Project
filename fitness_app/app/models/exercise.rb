class Exercise < ActiveRecord::Base
	belongs_to :user
	has_many :exercise_routines, foreign_key: "routine_id", dependent: :destroy
	has_many :routines, :through => :exercise_routines
	validates :user_id, presence: true
	validates :E_title, presence: true, length: {maximum: 20}
	validates :E_type, presence: true, length: {maximum: 20}



	
end
