class Artworks::LikesController < ApplicationController 
	before_action :authenticate_user!
	before_action :set_artwork 

	def create 
		@artwork.likes.where(user_id: current_user.id).first_or_create

		respond_to do |format|
			format.html { redirect_to @artwork }
			format.js
		end
	end

	def destroy
		@artwork.likes.where(user_id: current_user.id).destroy_all

		respond_to do |format|
			format.html { redirect_to @artwork }
			format.js
		end
	end

private 

	def set_artwork 
		@artwork = Artwork.find(params[:artwork_id])
	end

end