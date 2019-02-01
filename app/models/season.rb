# frozen_string_literal: true

# app/models/season.rb
class Season < ApplicationRecord
  validates :name, presence: true
end
