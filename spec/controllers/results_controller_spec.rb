require "rails_helper"

RSpec.describe ResultsController, type: :controller do
  before(:each) do
    @competition = Competition.create(name: "O careca com mais cabelo", unit: "cm")
    @athlete = Athlete.create(name: "vin diesel")
  end

  let(:valid_attributes) {
    {
      competition_id: @competition.id,
      athlete_id: @athlete.id,
      result_value: 66.6
    }
  }

  let(:invalid_attributes) {
    {
      competition_id: nil,
      athlete_id: nil,
      result_value: nil
    }
  }

  describe "index method" do
    it "should return all the results" do
      result = Result.create! valid_attributes
      get :index, params: { format: :json }
      expect(response).to be_successful
    end
  end

  describe "show method" do
    it "should return the result with the correct id" do
      result = Result.create! valid_attributes
      get :show, params: { format: :json , id: result.to_param }
      expect(response).to be_successful
    end
  end

  describe "destroy method" do
    it "should delete the correct result given the id provided" do
      result = Result.create! valid_attributes
      expect {
        delete :destroy, params: { format: :json, id: result.to_param }
      }.to change(Result, :count).by(-1)
    end
  end
  
  describe "create method" do
    context "tests with valid params" do
      it "should create a new result" do
        expect {
          post :create, params: { format: :json }.merge(valid_attributes)
        }.to change(Result, :count).by(1)
      end
    end
    
    context "tests with invalid params" do
      it "it should fail and return an return an error" do
        
        expect{
          post :create, params: { format: :json }.merge(invalid_attributes)
        }.to raise_error
      end
    end
  end
end
