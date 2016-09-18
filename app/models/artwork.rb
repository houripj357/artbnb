class Artwork < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true, length: { minimum: 3, maximum: 50 } 
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :user_id, presence: true

	has_attached_file :image, styles: { large: "600x600#", medium: "300x300#", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end