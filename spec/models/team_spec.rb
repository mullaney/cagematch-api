require 'rails_helper'

RSpec.describe Team, type: :model do
  let (:team) { create(:team) }

  it "is valid with valid attributes" do
    expect(team).to be_valid
  end

  it "is not valid without a name" do
    team.name = ""
    expect(team).to_not be_valid
    team.name = nil
    expect(team).to_not be_valid
  end

  it "is not valid without an associated cagematch" do
    team.cagematch_id = nil
    expect(team).to_not be_valid
  end
end
