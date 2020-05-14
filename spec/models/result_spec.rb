require "rails_helper"

describe "Test results with competition with only one attempt" do
  before(:each) do
    @result = build(:result_from_competition_with_only_one_attempt)
  end

  it "should not be possible if the athlete has no attempts left" do
    @result.save
    new_attempt = Result.new(competition: @result.competition,
                            athlete: @result.athlete,
                            result_value: 13.13)
    expect(new_attempt).to_not be_valid
  end
end

describe "Test results with competition with more then one attempt" do
  before(:each) do
    @result = build(:result_from_competition_with_more_then_one_attempt)
  end

  it "should be possible if the athlete has no attempts left" do
    @result.save
    new_attempt = Result.new(competition: @result.competition,
                            athlete: @result.athlete,
                            result_value: 13.13)
    expect(new_attempt).to be_valid
  end
end

RSpec.describe Result, type: :model do
  before(:each) do
    @result = build(:result_from_competition_with_only_one_attempt)
  end

  it "should not be valid if competition is finished" do
    @result.competition.finished = true
    expect(@result).to_not be_valid
  end

  it "should not be valid without a competition" do
    @result.competition = nil
    expect(@result).to_not be_valid
  end

  it "should not be valid without an athlete" do
    @result.athlete = nil
    expect(@result).to_not be_valid
  end

  it "should not be valid if result value is negative" do
    @result.result_value = -1423
    expect(@result).to_not be_valid
  end

  it "should not be valid without a result value" do
    @result.result_value = nil
    expect(@result).to_not be_valid
  end

  it "should not be valid if result value is not a number" do
    @result.result_value = "treze"
    expect(@result).to_not be_valid
  end
end

