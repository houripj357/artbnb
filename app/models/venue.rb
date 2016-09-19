class Venue < ActiveRecord::Base
	belongs_to :user
	
	validates :name, presence: true, uniqueness: { case_sensitiity: false }, length: { minimum: 3, maximum: 50 } 
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :address, presence: true, length: { minimum: 10, maximum: 300 } 
	validates :phone_number, presence: true, length: { minimum: 9, maximum: 20 }

	has_attached_file :image, styles: { large: "600x600#", medium: "300x300#", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end