# frozen_string_literal: true

FactoryBot.define do
  factory :fight do
    tagline { 'MyString' }
    location { 'ucb' }
    season { '2019' }
    notes { 'MyText' }
    start_time { '2019-01-21 11:32:32' }
    is_exhibition { false }
    cagematch
  end
end
