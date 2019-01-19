require 'spec_helper'

RSpec.describe Cagematch, type: :model do
  let (:cagematch) { create(:cagematch) }

  it "is valid with valid attributes" do
    expect(cagematch).to be_valid
  end

  it "is not valid without a title" do
    cagematch.title = ""
    expect(cagematch).to_not be_valid
    cagematch.title = nil
    expect(cagematch).to_not be_valid
  end

  it "is not valid without a slug" do
    cagematch.slug = ""
    expect(cagematch).to_not be_valid
    cagematch.slug = nil
    expect(cagematch).to_not be_valid
  end

  it "is not valid if the slug has spaces" do
    cagematch.slug = "my slug"
    expect(cagematch).to_not be_valid
  end

  it "is not valid if the slug has capital letters" do
    cagematch.slug = "mySlug"
    expect(cagematch).to_not be_valid
  end

  it "is not valid if the slug has underscores" do
    cagematch.slug = "my_slug"
    expect(cagematch).to_not be_valid
  end

  it "is not valid if the slug has slashes" do
    cagematch.slug = "/myslug"
    expect(cagematch).to_not be_valid
  end

  it "is valid with numbers, letters and dashes" do
    cagematch.slug = "my-slug-1"
    expect(cagematch).to be_valid
  end
end
