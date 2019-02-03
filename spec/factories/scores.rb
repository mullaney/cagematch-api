FactoryBot.define do
  factory :score do
    votes { 1 }
    team
    fight
    status { 'lost' }
  end
end
