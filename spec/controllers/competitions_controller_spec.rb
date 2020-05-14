require "rails_helper"

RSpec.describe CompetitionsController, type: :controller do
  let(:valid_attributes) {
    {
      name: "FIGHT CLUB. shh...",
      unit: "m"
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      unit: nil,
      finished: nil,
      max_attempts: nil,
      win_definition: nil
    }
  }

  describe "index method" do
    it "should return all the competitions" do
      competition = Competition.create! valid_attributes
      get :index, params: { format: :json }
      expect(response).to be_successful
    end
  end

  describe "create method" do
    context "tests with valid params" do
      it "should create a new competition" do
        expect {
          post :create, params: { format: :json }.merge(valid_attributes)
        }.to change(Competition, :count).by(1)
      end
    end

    describe "show method" do
      it "should return the competition with the correct id" do
        competition = Competition.create! valid_attributes
        get :show, params: { format: :json, id: competition.id }
        expect(response).to be_successful
      end
    end

    context "texts with invalid params" do
      it "it should fail and return an return an error" do
        post :create, params: { format: :json }.merge(invalid_attributes)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "destroy method" do
    it "should delete the correct competition given the provided id" do
      competition = Competition.create! valid_attributes
      expect {
        delete :destroy, params: { format: :json, id: competition.to_param }
      }.to change(Competition, :count).by(-1)
    end
  end

  describe "finish method" do
    it "should finish a competition correctly" do
      competition = Competition.create! valid_attributes
      patch :finish, params: { format: :json, id: competition.to_param }
      competition.reload
      expect(competition.finished).to eq(true)
    end
  end

  describe "update method" do
    context "with valid params" do
      let(:updated_attributes) {
        {
          name: "uma ferrari x celta a 80km"
        }
      }

      it "should update the correct competition given the provided id" do
        competition = Competition.create! valid_attributes
        patch :update, params: { format: :json, id: competition.to_param }.merge(updated_attributes)
        competition.reload
        expect(competition.name).to eq(updated_attributes[:name])
      end
    end

    context "with invalid params" do
      it "it should fail and return an return an error" do
        competition = Competition.create! valid_attributes

        patch :update, params: { format: :json, id: competition.to_param }.merge(invalid_attributes)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end
end
