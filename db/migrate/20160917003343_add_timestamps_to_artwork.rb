class AddTimestampsToArtwork < ActiveRecord::Migration[5.0]
  def change
  	add_column :artworks, :created_at, :date_time
	add_column :artworks, :updated_at, :date_time
  end
end
