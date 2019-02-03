FactoryBot.define do
  factory :score do
    votes { 1 }
    team
    fight
    winner { false }
  end
end
