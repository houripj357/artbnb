class AddUserIdToArtworks < ActiveRecord::Migration[5.0]
  def change
  	add_column :artworks, :user_id, :integer
  end
end
