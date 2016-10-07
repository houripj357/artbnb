class AddPriceToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :price, :decimal
  end
end
