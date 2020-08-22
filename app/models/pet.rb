class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approx_age, :sex, :shelter_name
end
