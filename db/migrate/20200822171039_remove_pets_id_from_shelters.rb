class RemovePetsIdFromShelters < ActiveRecord::Migration[5.2]
  def change
    remove_index :shelters, name: "index_shelters_on_pets_id"
    remove_column :shelters, :pets_id
  end
end
