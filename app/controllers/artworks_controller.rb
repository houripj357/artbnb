class ArtworksController < ApplicationController
	def new 
		@artwork = Artwork.new
	end

	def create
		#render plain: params[:artwork].inspect
		@artwork = Artwork.new(artwork_params)
		@artwork.save
		redirect_to artworks_show(@artwork)
	end

	def index
		@artworks = Artwork.all
	end

private 
	def artwork_params
		params.require(:artwork).permit(:title, :description)
	end

end