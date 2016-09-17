class ArtworksController < ApplicationController
	def new 
		@artwork = Artwork.new
	end

	def create
		@artwork = Artwork.new(artwork_params)
		if @artwork.save
			flash[:notice] = "Artwork was successfully uploaded"
			redirect_to artwork_path(@artwork)
		else
			render 'new'
		end
	end

	def show 
		@artwork = Artwork.find(params[:id])
	end

	def index
		@artworks = Artwork.all
	end

private 
	def artwork_params
		params.require(:artwork).permit(:title, :description)
	end

end