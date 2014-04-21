class Routine < ActiveRecord::Base
	belongs_to :user
	has_many :exercise_routines, foreign_key: "exercise_id", dependent: :destroy
	has_many :exercises, :through => :exercise_routines

	validates :R_title, presence: true, uniqueness: { case_sensitive: false}
end
