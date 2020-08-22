require 'rails_helper'
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
RSpec.describe 'As a Visitor' do
  it 'I can delete a shelter' do
    shelter = Shelter.create(name: "Rando Name", address: "5 Street st.",
    city: "Lakewood", state: "CO", zip: 80204)

    visit "/shelters/#{shelter.id}"

    click_link 'Delete'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(shelter.name)
  end
end
