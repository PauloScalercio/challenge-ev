require "rails_helper"

RSpec.describe Competition, type: :model do
  before(:each) do
    @competition = build(:competition_with_only_one_attempt)
  end

  it "should be valid when with a name" do
    expect(@competition).to be_valid
  end

  it "should not be valid when having an empty name" do
    @competition.name = ''
    expect(@competition).to_not be_valid
  end

  it "should not be valid when having the same name" do
    @competition.save
    copy_competition = build(:competition_with_only_one_attempt)
    expect(copy_competition).to_not be_valid
  end

  it "should not be valid when without a name" do
    @competition.name = nil
    expect(@competition).to_not be_valid
  end

  it "should set max as a default value when no win definition is provided" do
    expect(@competition.win_definition).to eq("max")
  end

  it "should not have finished value set to true by default" do
    expect(@competition.finished).to eq(false)
  end

  it "should set max attempts to 1 as default value" do
    expect(@competition.max_attempts).to eq(1)
  end

  it "should not be valid if max attempts is not a number" do
    @competition.max_attempts = "treze"
    expect(@competition).to_not be_valid
  end
end
