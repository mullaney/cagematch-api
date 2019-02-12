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

  context 'with many fights and teams' do
    let!(:fight1) { create(:fight, season_id: season.id) }
    let!(:fight2) { create(:fight, season_id: season.id) }
    let!(:score1) { create(:score, fight_id: fight1.id) }
    let!(:score2) { create(:score, fight_id: fight1.id) }
    let!(:score3) { create(:score, fight_id: fight2.id) }
    let!(:score4) { create(:score, fight_id: fight2.id) }
    it 'should have many fights' do
      expect(season.fights.count).to eq(2)
    end

    it 'should have many scores and teams' do
      expect(season.fights.first.scores.count).to eq(2)
      expect(season.fights.last.scores.count).to eq(2)
      expect(season.fights.first.scores.first.team).to be_valid
      expect(season.fights.last.scores.last.team).to be_valid
    end
  end
end
