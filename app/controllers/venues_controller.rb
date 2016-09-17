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

	def update
		@venue = Venue.find(params[:id])
		if @venue.update(venue_params)
			flash[:notice] = "Venue details were successfully updated"
			redirect_to venue_path(@venue)
		else
			render 'edit'
		end
	end

	def show 
		@venue = Venue.find(params[:id])
	end

	def index
		@venues = Venue.all
	end

private 
	def venue_params
		params.require(:venue).permit(:name, :description, :address, :phone_number, :image)
	end

end