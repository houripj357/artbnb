class User < ApplicationRecord
	has_many :artworks 
	
	enum role: [:patron, :artist, :admin]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role 
		self.role ||= :patron
	end

  	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :profile, styles: { thumb: "150x150#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :profile, content_type: /\Aimage\/.*\z/
	# validates_attachment_content_type :profile, :content_type => ["jpg", "jpeg", "png", "gif"]

end
