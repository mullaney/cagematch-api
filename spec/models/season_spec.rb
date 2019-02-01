# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Season, type: :model do
  let(:season) { create(:season) }

  it 'is valid with valid attributes' do
    expect(season).to be_valid
  end

  it 'is not valid without a name' do
    season.name = ''
    expect(season).to_not be_valid
    season.name = nil
    expect(season).to_not be_valid
  end

  it 'is not valid without an associated cagematch' do
    season.cagematch_id = nil
    expect(season).to_not be_valid
  end
end
