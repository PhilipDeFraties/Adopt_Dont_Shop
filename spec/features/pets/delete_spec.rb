require 'rails_helper'
# User Story 12, Pet Delete
#
# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
RSpec.describe "Delete Pet" do
  shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",
                             city: "Lakewood", state: "CO", zip: 80204)
  james = shelter_1.pets.create(image_path: 'cat1.jpg', name: "James",
                                approx_age: 7, sex: "Male",
                                 description: "Snuggle bug")
  describe "As a Visitor"
    describe "When visiting a pet show page"
      describe "Then I see a link to delete the pet 'Delete Pet'"
        describe "When I click the link a 'DELETE' request is sent to
                  '/pets/:id'"
          it "and I am redirected to the pet index page where I no
                  longer see this pet" do

            visit "/pets/#{james.id}"
            click_on "Delete Pet"

            expect(current_path).to eq("/pets")

            expect(page).not_to have_content("#{james.attributes.values}")
          end
end
