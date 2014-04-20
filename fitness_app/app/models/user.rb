class User < ActiveRecord::Base
	before_save {self.emailAdd = emailAdd.downcase }
	before_create :create_remember_token

	has_many :statuses, dependent: :destroy

	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed

	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
	has_many :followers, through: :reverse_relationships, source: :follower

	has_many :routines, dependent: :destroy
	has_many :exercises, dependent: :destroy
	has_many :workouts, dependent: :destroy
	
	validates :displayName, presence: true, length: {maximum: 25}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :emailAdd, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, on: :create
	validates :password, presence: true, length: {minimum: 6}, on: :update, unless: Proc.new{ |user| user.password.blank?}

	validates :song1, length: {maximum: 30}
	validates :song2, length: {maximum: 30}
	validates :song3, length: {maximum: 30}
	validates :song4, length: {maximum: 30}
	validates :song5, length: {maximum: 30}

	validates :artist1, length: {maximum: 20}
	validates :artist2, length: {maximum: 20}
	validates :artist3, length: {maximum: 20}
	validates :artist4, length: {maximum: 20}
	validates :artist5, length: {maximum: 20}

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
		Status.from_users_followed_by(self)
	end

	def exercise_list
		Exercise.exercises_of(self)
	end

	def following?(other_user)
		relationships.find_by(followed_id: other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by(followed_id: other_user.id).destroy
	end

	private

		def create_remember_token
			self.remember_token = User.hash(User.new_remember_token)
		end

end
