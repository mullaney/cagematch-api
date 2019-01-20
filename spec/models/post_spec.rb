require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  it "is valid with valid attributes" do
    expect(post).to be_valid
  end
  
  it "is not valid without a title" do
    post.title = ""
    expect(post).to_not be_valid
    post.title = nil
    expect(post).to_not be_valid
  end

  it "is not valid without a cagematch" do
    post.cagematch_id = nil
    expect(post).to_not be_valid
  end

  it "is not valid without an admin_user" do
    post.admin_user = nil
    expect(post).to_not be_valid
  end

  it "is not valid without an author" do
    post.author = ""
    expect(post).to_not be_valid
    post.author = nil
    expect(post).to_not be_valid
  end

  it "is not valid without a category" do
    post.category = ""
    expect(post).to_not be_valid
    post.category = nil
    expect(post).to_not be_valid
  end

  describe ".excerpt" do
    it "returns a string" do
      expect(post.excerpt.class).to eq(String)
    end

    context "when text is short" do
      it "returns the text" do
        post.text = "A short phrase"
        expect(post.excerpt).to eq("A short phrase")
      end
    end

    context "when text is long" do
      it "returns the text" do
        post.text = "A longer phrase with more than 50 characters should return only some of the string"
        expect(post.excerpt).to eq("A longer phrase with more than 50 characters...")
      end
    end
  end
end
