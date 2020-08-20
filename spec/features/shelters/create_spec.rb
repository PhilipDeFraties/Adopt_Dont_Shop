require 'rails_helper'
# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
RSpec.describe "New shelter" do
  describe "As a visitor" do
    describe "When I visit the new shelter form by clicking a link on the index" do
      it "I can create a new shelter" do

  # before :each do
  #   @shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",
  #   city: "Lakewood", state: "CO", zip: 80204)
  #   @shelter_2 = Shelter.create(name: "Shelter Name 2", address: "6 Street st.",
  #   city: "Denver", state: "CO", zip: 80204)
  # end

      visit "/shelters"
      click_link "New Shelter"

      expect(current_path).to eq("/shelters/new")

      fill_in 'Name', with: "Lots Of Cats"
      fill_in 'Address', with: "5555 Street St."
      fill_in 'City', with: "Denver"
      fill_in 'State', with: "CO"
      fill_in 'Zip', with: "80203"
      click_on 'Create Shelter'

      expect(current_path).to eq("/shelters")
      expect(page).to have_content('Lots Of Cats')
      end
    end
  end
end
