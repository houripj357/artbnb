class ChangeAddressForVenues < ActiveRecord::Migration[5.0]
  def change 
  	change_table :venues do |t|
  		t.remove :address 
  		t.text :street, :street_cont, :city, :state, :country, :zip
  	end
  end
end