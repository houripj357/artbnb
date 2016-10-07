class UserPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def index?
		true
	end

	def show?
		true 
	end

	def edit?
		true
	end

	def update? 
		true
	end

	def search?
		true
	end

	def my_friends?
		true
	end

	def add_friend?
		true
	end

	def thanks?
		true
	end

	def stripe?
		true
	end

	def destroy? 
		@current_user.admin?
	end

end