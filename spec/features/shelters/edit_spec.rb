require 'rails_helper'
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
RSpec.describe "Edit shelter" do
  before :each do
    @shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",
    city: "Lakewood", state: "CO", zip: 80204)
  end
  describe "As a visitor" do
    describe "When I visit a shelter edit page by clicking a link on a show page" do
      it "I can edit an shelter" do
        visit "/shelters/#{@shelter_1.id}"
        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

        fill_in 'Name', with: "Lots Of Cats"
        fill_in 'Address', with: "5555 Street St"
        fill_in 'City', with: "Denver"
        fill_in 'State', with: "CO"
        fill_in 'Zip', with: "80203"
        click_on 'Update Info'

        expect(current_path).to eq("/shelters/#{@shelter_1.id}")
        expect(page).to have_content("Lots Of Cats")
        expect(page).to have_content("5555 Street St")
        expect(page).to have_content("Denver")
        expect(page).to have_content("CO")
        expect(page).to have_content("80203")
      end
    end
  end
end
