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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(image_path: params[:image_path], name: params[:name], approx_age: params[:approx_age], sex: params[:sex], description: params[:description])
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private
  def pet_params
    params.permit(:image_path, :name, :approx_age, :sex, :shelter_id,
       :description)
  end
end
