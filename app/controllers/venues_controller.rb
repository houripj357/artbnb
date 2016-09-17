class VenuesController < ApplicationController 
	def new
		@venue = Venue.new
	end

	def create 
		@venue = Venue.new(venue_params)
		if @venue.save
			flash[:notice] = "Venue was successfully registered"
			redirect_to venue_path(@venue)
		else
			render 'new'
		end
	end

	def edit
		@venue = Venue.find(params[:id])
	end

	def show 
		@venue = Venue.find(params[:id])
	end

	def index
		@venues = Venue.all
	end

private 
	def venue_params
		params.require(:venue).permit(:name, :description, :address, :phone_number)
	end

end