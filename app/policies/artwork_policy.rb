class ArtworkPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def new
		# @current_user.artist? || @current_user.admin? 
	end

	def create
		# @current_user.artist? || @current_user.admin? 
	end

	def edit
		@current_user.artist? || @current_user.admin? 
	end

	def update
		@current_user.artist? || @current_user.admin? 
	end

	def destroy
		@current_user.admin? 
	end

	def index?
		false
	end

	def show?
		false 
	end

end