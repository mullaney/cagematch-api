# frozen_string_literal: true

# app/models/fight.rb
class Fight < ApplicationRecord
  belongs_to :cagematch
  belongs_to :season
  has_one :team, as: :winner

  validates :start_time, presence: true

  def winner
    return nil if winner_id.nil?
    Team.find(winner_id)
  end

  def winner=(team)
    if team.class == Team
      self.winner_id = team.id
    elsif team.class == Integer
      new_winner = Team.find(team)
      self.winner_id = new_winner.id
    else
      raise StandardError
    end
    save
  end

  def last_fight
    @last_fight ||= Fight.where(cagematch_id: cagematch_id).order('start_time ASC').last
  end
end
