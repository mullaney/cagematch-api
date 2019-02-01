# frozen_string_literal: true

# app/models/season.rb
class Season < ApplicationRecord
  validates :name, presence: true
  belongs_to :cagematch
end
