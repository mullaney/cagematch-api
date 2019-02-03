# frozen_string_literal: true

# app/models/team.rb
class Team < ApplicationRecord
  belongs_to :cagematch
  has_many :scores
  validates :name, presence: true
end
