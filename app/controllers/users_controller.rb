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

    def my_friends
        @friendships = current_user.friends
        authorize User
    end

	def search
        @users = User.search(params[:search_param])

        if @users
            @users = current_user.except_current_user(@users)
            render partial: 'friends/lookup'
        else
            render status: :not_found, nothing: true
        end
        authorize User
    end

    def add_friend
    @friend = User.find(params[:friend])
        current_user.friendships.build(friend_id: @friend.id)
            if current_user.save
                redirect_to my_friends_path, notice: "Friend was successfully added."
            else
                redirect_to my_friends_path, flash[:error] = "There was an error with adding user as friend."
            end
        authorize User
    end
end