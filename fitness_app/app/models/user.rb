class User < ActiveRecord::Base
	before_save {self.emailAdd = emailAdd.downcase }
	before_create :create_remember_token

	has_many :statuses, dependent: :destroy
	
	validates :displayName, presence: true, length: {maximum: 15}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :emailAdd, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, on: :create
	validates :password, presence: true, length: {minimum: 6}, on: :update, unless: Proc.new{ |user| user.password.blank?}

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
		Status.where("user_id = ?", id)
	end

	private

		def create_remember_token
			self.remember_token = User.hash(User.new_remember_token)
		end

end
