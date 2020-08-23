require 'rails_helper'

describe Pet, type: :model do
  describe 'relationships' do
    it {should belong_to :shelter}
  end

  describe "validations" do
    it { should validate_presence_of :image_path }
    it { should validate_presence_of :name }
    it { should validate_presence_of :approx_age }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :shelter_id }
    it { should validate_presence_of :status }
    it { should validate_presence_of :description }
  end
end
