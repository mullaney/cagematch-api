# frozen_string_literal: true

# db/seeds.rb
cagematch = Cagematch.create!(
  title: 'Cage-Match NYC',
  slug: 'ucbt-nyc',
  description:  'Welcome to the world\'s most dangerous Improv show, where ' \
                'two mighty teams of gladiators will take the stage to prove ' \
                'who is the best of the best.\n\nThis is not an exhibition. ' \
                'This is a no-holds-barred competition. The audience ' \
                'determines the winner each week via secret ballot. The ' \
                'winner returns the following week to defend their title ' \
                'against a new challenger.'
)

file = File.read(File.dirname(__FILE__) + '/json_seeds/teams.json')
teams = JSON.parse(file)

returned_teams = []

teams.each do |team|
  returned_teams << Team.create!(
    cagematch_id: cagematch['id'],
    name: team['name'],
    tagline: team['tagline'],
    teamid: team['teamid']
  )
end

puts teams.length.to_s + ' teams added'

passkey = if Rails.env.production? && ENV['FIRST_ADMIN_PASSWORD'].present?
            process.env.FIRST_ADMIN_PASSWORD
          else
            'password'
          end

admin_user = AdminUser.create!(
  email: 'kvinklly@gmail.com',
  password: passkey,
  password_confirmation: passkey
)

file = File.read(File.dirname(__FILE__) + '/json_seeds/posts.json')
posts = JSON.parse(file)

posts.each do |post|
  Post.create!(
    cagematch_id: cagematch['id'],
    title: post['title'],
    text: post['text'],
    author: post['author'].present? ? post['author'] : 'CageMatch NYC',
    published_at: Time.at(post['date'].to_i),
    category: post['newscat'],
    admin_user_id: admin_user['id']
  )
end

puts posts.length.to_s + ' posts added'

file = File.read(File.dirname(__FILE__) + '/json_seeds/fights.json')
fights = JSON.parse(file)

returned_fights = []
zone = 'Eastern Time (US & Canada)'

fights.each do |fight|
  if fight['champid'] == '0'
    winner_id = nil
  else
    found = returned_teams.find do |team|
      team['teamid'].to_s == fight['champid']
    end
    winner_id = found['id']
  end

  returned_fights << Fight.create!(
    cagematch_id: cagematch['id'],
    tagline: fight['tag'],
    notes: fight['notes'],
    start_time: ActiveSupport::TimeZone[zone].parse(
      fight['date'] + ' 23:00:00'
    ),
    is_exhibition: fight['exhibition'] == 'Yes',
    location: fight['location'],
    winner_id: winner_id,
    fightid: fight['fightid'],
    season: fight['season']
  )
end

puts returned_fights.length.to_s + ' fights added'
