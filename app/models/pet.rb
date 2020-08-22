class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :image_path, :name, :approx_age, :sex, :shelter_id
end
