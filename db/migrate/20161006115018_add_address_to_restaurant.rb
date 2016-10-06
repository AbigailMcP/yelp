class AddAddressToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :address, :text
  end
end
