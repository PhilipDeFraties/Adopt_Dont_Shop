require 'rails_helper'
RSpec.describe "pets index page" do
    shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",city: "Lakewood", state: "CO", zip: 80204)
    shadow = shelter_1.pets.create(image_path: 'cat1.jpg', name: "Shadow", approx_age: 7, sex: "Male", adoptable: true)
    nooch = shelter_1.pets.create(image_path: "cat2.jpg", name: "Nooch", approx_age: 7, sex: "Male", adoptable: true)

  it "can see all pets info" do
      visit "/pets"
    expect(page).to have_xpath("//img['cat1.jpg']")
    expect(page).to have_content(shadow.name)
    expect(page).to have_content(shadow.approx_age)
    expect(page).to have_content(shadow.sex)
    expect(page).to have_content(shadow.shelter_id)
    expect(page).to have_xpath("//img['cat2.jpg']")
    expect(page).to have_content(shadow.name)
    expect(page).to have_content(shadow.approx_age)
    expect(page).to have_content(shadow.sex)
    expect(page).to have_content(shadow.shelter_id)
  end
end
