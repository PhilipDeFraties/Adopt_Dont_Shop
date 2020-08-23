class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @shelter.pets.create(pet_params)
    redirect_to "/shelters/#{@shelter.id}/pets"
  end

  private
  def pet_params
    params.permit(:image_path, :name, :approx_age, :sex, :shelter_id,
       :description)
  end
end
