class User < ActiveRecord::Base

	# Let's add our associations
	has_one :profile

	has_secure_password

	validates :password, 
						:length => { :in => 8..24 },
						:allow_nil => true

	validates :last_name, :email, :presence => true
	validates :gender, inclusion: { in: [1,2], message: "not selected" }

end
