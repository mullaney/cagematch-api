# frozen_string_literal: true

# app/models/score.rb
class Score < ApplicationRecord
  belongs_to :team
  belongs_to :fight
end
