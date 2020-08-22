require 'rails_helper'
RSpec.describe "pets index page" do
    shadow = Pet.create(image: 'cat1.jpg', name: "Shadow", approx_age: 7, sex: "Male", shelter_name: "Lots Of Cats")
    nooch = Pet.create(image: "cat2.jpg", name: "Nooch", approx_age: 7, sex: "Male", shelter_name: "Lots Of Cats")

  it "can see all pets info" do
      visit "/pets"
    expect(page).to have_xpath("//img['cat1.jpg']")
    expect(page).to have_content(shadow.name)
    expect(page).to have_content(shadow.approx_age)
    expect(page).to have_content(shadow.sex)
    expect(page).to have_content(shadow.shelter_name)
    expect(page).to have_xpath("//img['cat2.jpg']")
    expect(page).to have_content(shadow.name)
    expect(page).to have_content(shadow.approx_age)
    expect(page).to have_content(shadow.sex)
    expect(page).to have_content(shadow.shelter_name)
  end
end
