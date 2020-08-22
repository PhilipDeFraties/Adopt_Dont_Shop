class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :image_path
      t.string :name
      t.integer :approx_age
      t.string :sex
      t.references :shelter, foreign_key: true
      # t.belongs_to :shelter
    end
  end
end
