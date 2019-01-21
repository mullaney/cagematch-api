# frozen_string_literal: true

# app/models/team.rb
class Team < ApplicationRecord
  belongs_to :cagematch
  validates :name, presence: true
end
