class ArtworksController < ApplicationController
	# before_filter :authenticate_user!
	# after_action :verify_authorized
	
	def new 
		@artwork = Artwork.new
		# authorize User
	end

	def create
		@artwork = Artwork.new(artwork_params)
		authorize User
		if @artwork.save
			flash[:notice] = "Artwork was successfully uploaded"
			redirect_to artwork_path(@artwork)
		else
			render 'new'
		end
	end

	def edit
		@artwork = Artwork.find(params[:id])
		authorize User
	end

	def update
		@artwork = Artwork.find(params[:id])
		authorize User
		if @artwork.update(artwork_params)
			flash[:notice] = "Artwork was successfully updated"
			redirect_to artwork_path(@artwork)
		else
			render 'edit'
		end
	end

	def show 
		@artwork = Artwork.find(params[:id])
	end

	def index
		@artworks = Artwork.all
	end

	def destroy
		@artwork = Artwork.find(params[:id])
		authorize User
		@artwork.destroy
		flash[:notice] = "Artwork was successfully deleted"
		redirect_to artworks_path
	end

private 
	def artwork_params
		params.require(:artwork).permit(:title, :description, :image)
	end

end