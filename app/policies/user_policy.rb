class UserPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def index?
		false
	end

	def show?
		@current_user.artist? || @current_user.admin? 
	end

	def edit 
		@current_user.admin? || @current_user.patron? || @current_user.artist?
	end

	def update? 
		@current_user.admin? || @current_user.patron? || @current_user.artist?
	end

	def destroy? 
		return false if @current_user = @user
		@current_user.admin?
	end

end