require 'rails_helper'
# User Story 10, Shelter Pet Creation
#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
RSpec.describe "New pet" do
  shelter_1 = Shelter.create(name: 'Shelter Name 1', address: '5 Street st.',
                             city: 'Lakewood', state: 'CO', zip: 80204)
  shadow = shelter_1.pets.create(image_path: 'cat1.jpg', name: 'Shadow',
                                 approx_age: 7, sex: 'Male')

  describe "As a visitor I can click on a create pet link on a shelters pet index page"
    describe "I am taken to a page with a form for the new pets info"
      describe "when I click the Create Pet button I am redirected to the shelters pets index page"
        it "I see the new pets information" do

          visit "/shelters/#{shelter_1.id}/pets"

          click_link "Create Pet"

          expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

          fill_in 'Image path', with: "cat4.jpg"
          fill_in 'Name', with: "Bastion"
          fill_in 'Approx age', with: 2
          fill_in 'Sex', with: "Male"

          click_on 'Create Pet'

          expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
          expect(page).to have_content("Bastion")
        end
end
