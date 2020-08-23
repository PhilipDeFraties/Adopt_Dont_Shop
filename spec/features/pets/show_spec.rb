require 'rails_helper'
# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
RSpec.describe 'pets show page' do
  shelter_1 = Shelter.create(name: 'Shelter Name 1', address: '5 Street st.',
                             city: 'Lakewood', state: 'CO', zip: 80204)
  shadow = shelter_1.pets.create(image_path: 'cat1.jpg', name: 'Shadow',
                                 approx_age: 7, sex: 'Male', description: "Snuggle bug")

  it "can see all of a pet's info" do
    visit "/pets/#{shadow.id}"
    expect(page).to have_xpath("//img['cat1.jpg']")
    expect(page).to have_content(shadow.name)
    expect(page).to have_content(shadow.approx_age)
    expect(page).to have_content(shadow.sex)
    expect(page).to have_content(shadow.shelter_id)
    expect(page).to have_content(shadow.status)
    expect(page).to have_content(shadow.description)
  end
end
