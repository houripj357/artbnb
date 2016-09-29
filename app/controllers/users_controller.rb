class UsersController < ApplicationController
	before_action :authenticate_user!, only: :index
	after_action :verify_authorized
	
	def show 
		@user = User.find(params[:id])
		authorize User
	end

  	def index
    	@users = User.all
    	authorize User
  	end

end