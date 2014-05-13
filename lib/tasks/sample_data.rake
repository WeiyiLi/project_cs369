namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_series
    make_watchlists
  end
end

def make_users
  admin = User.create!(name: "Admin",
                       email: "admin@email.com",
                       password: "123456",
                       password_confirmation: "123456",
                       admin: true)
  49.times do |n|
    name  = Faker::Name.name
    email = "email-#{n+1}@email.com"
    password  = "123456"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_series
  10.times do |n|
    name  = "series#{n+1}"
    numberName = 0
    Series.create!(name: name)
      (rand(3)+1).times do |m|
      season = m+1
      (rand(10)+10).times do |k|
        number = k+1
        numberName = numberName + 1
        Episode.create!(name: "Episode#{numberName}",
                      season: season,
                      number: number,
                      series_id: n)
      end
    end
  end
end

def make_watchlists
  users = User.all
  series = Series.all
  user  = users.first
  followed_series = series[1..9]
  followers       = users[1..50]
  followed_series.each { |series| user.follow!(series) }
  followers.each      { |follower| follower.follow!(series[0]) }
end