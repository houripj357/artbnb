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

	def edit
		@artwork = Artwork.find(params[:id])
	end

	def update
		@artwork = Artwork.find(params[:id])
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
		@artwork.destroy
		flash[:notice] = "Artwork was successfully deleted"
		redirect_to artworks_path
	end

private 
	def artwork_params
		params.require(:artwork).permit(:title, :description, :image)
	end

end