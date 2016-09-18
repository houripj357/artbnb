class UsersController < ApplicationController
	before_action :authenticate_user!, only: :show
	before_filter :authenticate_user!
	# after_action :verify_authorized
	
	def show 
		@user = User.find(params[:id])
		authorize User
	end

  	def index
    	@users = User.all
  	end

end