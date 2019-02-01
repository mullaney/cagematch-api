# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fight, type: :model do
  let(:fight) { create(:fight) }

  it 'is valid with valid attributes' do
    expect(fight).to be_valid
  end

  it 'is not valid without an associated season' do
    fight.season_id = nil
    expect(fight).to_not be_valid
  end

  it 'is not valid without an associated cagematch' do
    fight.cagematch_id = nil
    expect(fight).to_not be_valid
  end

  it 'is not valid without a start_time' do
    fight.start_time = nil
    expect(fight).to_not be_valid
  end

  it 'is valid when winner_id is nil' do
    fight.winner_id = nil
    expect(fight).to be_valid
  end

  describe 'winner=' do
    let(:team) { create(:team) }
    it 'should assign a new team as the winner' do
      fight.winner = team
      expect(fight.winner_id).to eq(team.id)
    end

    it 'should be able to assign new winner by number' do
      fight.winner = team.id
      expect(fight.winner_id).to eq(team.id)
    end

    it 'should raise an error if team is not an Integer or Team' do
      expect { fight.winner = 'New team' }.to raise_error(StandardError)
    end

    it 'should raise error if team id does not match a team in the database' do
      expect { fight.winner = team.id + 1 }.to raise_error(StandardError)
    end
  end

  describe 'last_fight' do
    let(:fight_first) { create(:fight) }
    it 'should return properties from the last scheduled fight' do
      fight.update_attributes(start_time: nil)
      expect(fight.last_fight.start_time).to eq(fight_first.start_time)
    end
  end
end
