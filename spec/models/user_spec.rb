require 'spec_helper'
require 'rails_helper'



RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let!(:invalid_user) { User.new(:password => "New York") }
  let!(:valid_user) { User.create!(username: "Plib", password: "Swordfish") }

  it "validates presence of username" do
    expect(invalid_user).not_to be_valid
  end


  describe "::find_by_credentials" do
    it "finds the user" do
      expect(User.find_by_credentials("Plib", "Swordfish")).to eq(valid_user)
    end
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should have_many(:goals) }

end


#
# describe "User" do
#   it { should validate_presence_of(:username) }
# end
