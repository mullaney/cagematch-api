# frozen_string_literal: true

# db/seeds.rb
module Db
  # Db::Seeds
  class Seeds
    TIME_ZONE = 'Eastern Time (US & Canada)'

    def go
      admin_user = seed_admin_user
      cagematch = seed_cagematch
      seed_posts(admin_user, cagematch)
      teams = seed_teams(cagematch)
      fights_data = load_fights_data
      seasons = seed_seasons(fights_data, cagematch)
      fights = seed_fights(fights_data, cagematch, seasons, teams)
      scores = seed_scores(teams, fights)
      find_fights_with_no_scores(fights, scores)
    end

    private

    def seed_admin_user
      passkey = if Rails.env.production? && ENV['FIRST_ADMIN_PASSWORD'].present?
                  ENV['FIRST_ADMIN_PASSWORD']
                else
                  'password'
                end

      admin_user = AdminUser.create!(
        email: 'kvinklly@gmail.com',
        password: passkey,
        password_confirmation: passkey
      )
      puts ''
      puts "Seeded #{admin_user.email} as admin_user"
      admin_user
    end

    def seed_cagematch
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
      puts "Seeded #{cagematch.title}"
      cagematch
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
      puts posts.length.to_s + ' posts added'
    end

    def seed_teams(cagematch)
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

      puts returned_teams.length.to_s + ' teams added'
      returned_teams
    end

    def load_fights_data
      file = File.read(File.dirname(__FILE__) + '/json_seeds/fights.json')
      JSON.parse(file)
    end

    def seed_seasons(fights_data, cagematch)
      seasons_data = fights_data.map { |f| f['season'] }.uniq
      seasons = []
      seasons_data.each do |season|
        seasons << Season.create!(
          cagematch_id: cagematch['id'],
          name: season
        )
      end
      puts seasons.length.to_s + ' seasons added'
      seasons
    end

    def seed_fights(fights_data, cagematch, seasons, teams)
      fights = []
      fights_data.each do |fight|
        if fight['champid'] == '0'
          winner_id = nil
        else
          found_team = teams.find do |team|
            team['teamid'].to_s == fight['champid']
          end
          winner_id = found_team['id']
        end

        found_season = seasons.find do |season|
          season['name'] == fight['season']
        end

        fights << Fight.create!(
          cagematch_id: cagematch['id'],
          tagline: fight['tag'],
          notes: fight['notes'],
          start_time: ActiveSupport::TimeZone[TIME_ZONE].parse(
            fight['date'] + ' 23:00:00'
          ),
          is_exhibition: fight['exhibition'] == 'Yes',
          location: fight['location'],
          winner_id: winner_id,
          fightid: fight['fightid'],
          season_id: found_season['id']
        )
      end

      puts fights.length.to_s + ' fights added'
      fights
    end

    def seed_scores(teams, fights)
      file = File.read(File.dirname(__FILE__) + '/json_seeds/scores.json')
      scores = JSON.parse(file)

      returned_scores = []
      scores.each do |score|
        found_team = teams.find { |team| team['teamid'].to_s == score['teamid'] }
        found_fight = fights.find { |fight| fight['fightid'].to_s == score['fightid'] }
        if found_fight.nil?
          p score
          next
        end
        returned_scores << Score.create!(
          votes: score['score'],
          team_id: found_team['id'],
          fight_id: found_fight['id'],
          status: new_status_code(score['decision'])
        )
      end
      puts returned_scores.length.to_s + ' scores added'
      returned_scores
    end

    def find_fights_with_no_scores(fights, scores)
      fights.each do |fight|
        p fight unless scores.find { |sc| sc['fight_id'] == fight.id }
      end
    end

    def new_status_code(old_code)
      case old_code
      when 'Lose'
        'lost'
      when 'Tie'
        'tied'
      when 'Win'
        'won'
      end
    end
  end
end

seeds = Db::Seeds.new
seeds.go
