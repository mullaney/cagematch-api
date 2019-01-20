# frozen_string_literal: true

# /app/models/admin_user.rb
class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :post
end
