class Cagematch < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true
  validates_format_of :slug, with: /\A[a-z0-9\-]+\z/
  has_many :posts
  has_many :teams
end
