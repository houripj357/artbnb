class ArtworkPolicy < ApplicationPolicy

	def new?
		@current_user.artist? || @current_user.admin?  
	end

	def create?
		@current_user.artist? || @current_user.admin? 
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
		true 
	end

	def show?
		true 
	end

end