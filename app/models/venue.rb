class Venue < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3, maximum: 50 } 
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :address, presence: true, length: { minimum: 10, maximum: 300 } 
	validates :phone_number, presence: true, length: { minimum: 9, maximum: 20 }

end