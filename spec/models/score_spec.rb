# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Score, type: :model do
  let(:score) { create(:score) }

  it 'is valid with valid attributes' do
    expect(score).to be_valid
  end

  it 'is not valid without an associated team' do
    score.team_id = nil
    expect(score).to_not be_valid
  end

  it 'is not valid without an associated fight' do
    score.fight_id = nil
    expect(score).to_not be_valid
  end

  # A score of nil would mean the fight score has not yet been recorded
  it 'is valid with no votes' do
    score.votes = nil
    expect(score).to be_valid
  end

  # status should confirm who won the cagematch, however, this seemingly redundant
  # field is for the unlikely situation that a team had more votes and
  # is disqualified or that there was a tie, but still a declared winner
  it 'is valid with no value for status' do
    score.status = nil
    expect(score).to be_valid
  end
end
