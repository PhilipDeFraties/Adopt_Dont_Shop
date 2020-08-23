require 'rails_helper'

RSpec.describe "shelter pets index page" do
  shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",
     city: "Lakewood", state: "CO", zip: 80204)
  james = shelter_1.pets.create(image_path: 'cat1.jpg', name: "James",
     approx_age: 7, sex: "Male", description: "Snuggle bug")
  nooch = shelter_1.pets.create(image_path: "cat2.jpg", name: "Nooch",
     approx_age: 7, sex: "Male", description: "Biter")

    it "can see all pets within a shelter" do
      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_xpath("//img['cat1.jpg']")
      expect(page).to have_content(james.name)
      expect(page).to have_content(james.approx_age)
      expect(page).to have_content(james.sex)
      expect(page).to have_content(james.shelter_id)
      expect(page).to have_xpath("//img['cat2.jpg']")
      expect(page).to have_content(nooch.name)
      expect(page).to have_content(nooch.approx_age)
      expect(page).to have_content(nooch.sex)
      expect(page).to have_content(nooch.shelter_id)
    end
end
