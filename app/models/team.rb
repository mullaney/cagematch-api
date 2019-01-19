class Team < ApplicationRecord
  belongs_to :cagematch
  validates :name, presence: true
end
