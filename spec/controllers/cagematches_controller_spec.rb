require 'rails_helper'

RSpec.describe Api::V1::CagematchesController, type: :controller do
  let(:valid_attributes) {
    {
      "title" => "CageMatch Title",
      "slug" => "my-slug"
    }
  }

  let(:valid_session) { {} }

  describe "api/v1" do
    describe "GET #index" do
      it "returns a success response" do
        cagematch = Cagematch.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        cagematch = Cagematch.create! valid_attributes
        get :show, params: {id: cagematch.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
