class RemoveFieldFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :adoptable
  end
end
