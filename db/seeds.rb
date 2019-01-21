# frozen_string_literal: true

# db/seeds.rb
cagematch = seed_cagematch
admin_user = seed_admin_user
seed_posts(admin_user, cagematch)
seed_teams(cagematch)

def seed_cagematch
  Cagematch.create!(
    title: 'Cage-Match NYC',
    slug: 'ucbt-nyc',
    description: 'Welcome to the world\'s most dangerous Improv show, where two mighty teams of gladiators will take the stage to prove who is the best of the best.\n\nThis is not an exhibition. This is a no-holds-barred competition. The audience determines the winner each week via secret ballot. The winner returns the following week to defend their title against a new challenger.'
  )
end

def seed_admin_user
  AdminUser.create!(
    email: 'kvinklly@gmail.com',
    password: 'password',
    password_confirmation: 'password'
  )
end

def seed_posts(admin_user, cagematch)
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
end

def seed_teams(cagematch)
  file = File.read(File.dirname(__FILE__) + '/json_seeds/teams.json')
  teams = JSON.parse(file)

  teams.each do |team|
    Team.create!(
      cagematch_id: cagematch['id'],
      name: team['name'],
      tagline: team['tagline']
    )
  end
end
