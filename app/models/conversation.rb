class Conversation < ApplicationRecord
	belongs_to :user
	has_many :users, through: :messages

end
