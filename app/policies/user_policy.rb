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
		@current_user.artist? || @current_user.patron? || @current_user.admin? 
	end

	def edit 
		@current_user.admin? || @current_user.patron? || @current_user.artist?
	end

	def update? 
		@current_user.admin? || @current_user.patron? || @current_user.artist?
	end

	def destroy? 
		@current_user.admin?
	end

end