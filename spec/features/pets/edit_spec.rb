require 'rails_helper'
# User Story 11, Pet Update
#
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
RSpec.describe "Edit pet" do
  shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",
                             city: "Lakewood", state: "CO", zip: 80204)
  james = shelter_1.pets.create(image_path: 'cat1.jpg', name: "James",
                                approx_age: 7, sex: "Male",
                                 description: "Snuggle bug")

  describe "As a visitor"
    describe "When I visit a Pet Show page I see a link to Update Pet"
      describe "When I click the link I'm taken to '/pets/:id/edit' where I see
                  a form to edit the pet's data."
        it "When I click the submit button I am redirected to the Pet Show
                    page where I can see the updated information for that
                      pet." do

          visit "/pets/#{james.id}"
          click_on "Update Pet"

          expect(current_path).to eq("/pets/#{james.id}/edit")

          fill_in 'Image path', with: "cat4.jpg"
          fill_in 'Name', with: "Bastion"
          fill_in 'Approx age', with: 2
          fill_in 'Sex', with: "Female"
          fill_in 'Description', with: "Biter"
          click_on 'Update Pet'

          expect(current_path).to eq("/pets/#{james.id}")
          expect(page).to have_xpath("//img['cat4.jpg']")
          expect(page).to have_content("Bastion")
          expect(page).to have_content(2)
          expect(page).to have_content("Female")
          expect(page).to have_content("Biter")

          expect(page).not_to have_content("#{james.attributes.values}")
        end
  end
