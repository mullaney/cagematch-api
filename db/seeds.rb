# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cagematch = Cagematch.create!(
  title: 'Cage-Match NYC',
  slug: 'ucbt-nyc',
  description: 'Welcome to the world\'s most dangerous Improv show, where two mighty teams of gladiators will take the stage to prove who is the best of the best.\n\nThis is not an exhibition. This is a no-holds-barred competition. The audience determines the winner each week via secret ballot. The winner returns the following week to defend their title against a new challenger.',
)

file = File.read(File.dirname(__FILE__) + '/json_seeds/teams.json')
teams = JSON.parse(file)

teams.each {|team|
  Team.create!(
    cagematch_id: cagematch['id'],
    name: team['name'],
    tagline: team['tagline']
  )
}

if Rails.env.development?
  admin_user = AdminUser.create!(
    email: 'kvinklly@gmail.com',
    password: 'password',
    password_confirmation: 'password'
  )

  3.times do
    Cagematch.create!(
      title: Faker::Address.city + ' CageMatch',
      slug: Faker::Internet.slug(nil, '-'),
      description: Faker::Lorem.paragraph
    )
  end
end

file = File.read(File.dirname(__FILE__) + '/json_seeds/posts.json')
posts = JSON.parse(file)

posts.each {|post|
  Post.create!(
    cagematch_id: cagematch['id'],
    title: post['title'],
    text: post['text'],
    author: post['author'].present? ? post['author'] : 'CageMatch NYC',
    published_at: Time.at(post['date'].to_i),
    category: post['newscat'],
    admin_user_id: admin_user['id']
  )
}
