require "rails_helper"

RSpec.describe Athlete, type: :model do
  before(:each) do
    @athlete = build(:athlete)
  end

  it "should be valid when having a name" do
    expect(@athlete).to be_valid
  end

  it "should not be valid when having the same name" do
    @athlete.save
    copy_athlete = build(:athlete)
    expect(copy_athlete).to_not be_valid
  end

  it "should not be valid when without a name" do
    @athlete.name = nil
    expect(@athlete).to_not be_valid
  end
end
