require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/posts").to be_routable
    end

    it "routes to #show" do
      expect(:get => "/api/v1/posts/1").to be_routable
    end

  end
end
