class ChangeTableForUsers < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.text :city, :country
  	end
  end
end
