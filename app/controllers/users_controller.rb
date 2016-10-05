class UsersController < ApplicationController
	before_action :authenticate_user!, only: :index
	after_action :verify_authorized

	def show 
		@user = User.find(params[:id])
		authorize User
	end

  	def index
    	@users = User.paginate(page: params[:page], per_page: 8)
    	authorize User
  	end

	def search
        @users = User.search(params[:search_param])

        if @users
            @users = current_user.except_current_user(@users)
            render partial: 'users/lookup'
        else
            render status: :not_found, nothing: true
        end
    end

end