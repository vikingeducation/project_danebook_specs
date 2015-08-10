class User < ActiveRecord::Base


	# Let's add our associations

		has_one :profile, dependent: :destroy
		has_many :posts, dependent: :destroy
		has_many :likes, dependent: :destroy
		has_many :comments, :as => :commentable, :foreign_key => :author_id

	# End associations


	# And any filters will go here

		before_create :generate_token

	# End filters

	
	has_secure_password

	
	validates :password, 
						:length => { :in => 8..24 },
						:allow_nil => true

	validates :last_name, :email, :presence => true
	validates :gender, inclusion: { in: [1,2], message: "not selected" }

	def name
		first_name + ' ' + last_name
	end
	
	def generate_token
		
		# QUESTION: Can we go over exactly how this works? Why is self[:auth_token]
		# setting this entry, I feel like it shouldn't. I believe I understand the 
		# while loop just the syntax is funny... this is a rescue loop?
		# ANSWER: self[:auth_token] == self.auth_token
		
		begin
			self[:auth_token] = SecureRandom.urlsafe_base64
		end	while User.exists?(:auth_token => self[:auth_token])
	end


	def regenerate_auth_token
		self.auth_token = nil
		generate_token
		save!
	end


end
