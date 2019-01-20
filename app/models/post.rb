# frozen_string_literal: true

# app/models/post.rb
class Post < ApplicationRecord
  belongs_to :cagematch
  belongs_to :admin_user

  validates :title, presence: true
  validates :author, presence: true
  validates :category, presence: true
  belongs_to :cagematch

  scope :unpublished, -> { where(published_at: nil) }
  scope :published, -> { where.not(published_at: nil) }

  def excerpt
    text.truncate(50, separator: ' ')
  end
end
