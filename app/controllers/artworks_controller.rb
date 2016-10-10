class ArtworksController < ApplicationController
	# before_action :authenticate_user!, only: :show
	before_action :authenticate_user!, only: :edit
	before_filter :authenticate_user!, only: :new
	after_action :verify_authorized
	
	def new 
		@artwork = Artwork.new
		authorize User
	end

	def create
		@artwork = Artwork.new(artwork_params)
		@artwork.user = current_user
		authorize User
		if @artwork.save
			flash[:success] = "Artwork was successfully uploaded"
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
			flash[:success] = "Artwork was successfully updated"
			redirect_to artwork_path(@artwork)
		else
			render 'edit'
		end
	end

	def show 
		@artwork = Artwork.find(params[:id])
		authorize User
	end

	def payment 
        @artwork = Artwork.find(params[:id])
        @artwork.user = current_user
        authorize User
    end

	def index
		@artworks = Artwork.paginate(page: params[:page], per_page: 12)
		authorize User
	end

	def destroy
		@artwork = Artwork.find(params[:id])
		authorize User
		@artwork.destroy
		flash[:danger] = "Artwork was successfully deleted"
		redirect_to artworks_path
	end

private 
	def artwork_params
		params.require(:artwork).permit(:title, :description, :image, :price)
	end

end