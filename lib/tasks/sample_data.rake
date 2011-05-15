require 'ffaker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
    admin = User.create!(:screen_name => "admin123",
                         :email => "admin123@example.com",
                         :password => "admin123",
                         :password_confirmation => "admin123")
    admin.toggle!(:admin)
    
    social = User.create!(:screen_name => "social",
                         :email => "social@example.com",
                         :password => "password",
                         :password_confirmation => "password")
    
    example_user = User.create!(:screen_name => "example_user",
                         :email => "example@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    9.times do |n|
       if n.even?
         name = Faker::NameCN.last_first
       else
         name  = Faker::Name.name
       end
       next if name.size < 3
       email = "example-#{n+1}@railstutorial.org"
       password  = "password"
       User.create!(:screen_name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    90.times do |n|
       if n.even?
         name = Faker::NameCN.last_first
       else
         name  = Faker::Name.name
       end
       next if name.size < 3
       email = "example-#{n+1}@example.com"
       password  = "password"
       User.create!(:screen_name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
end

def make_microposts
    User.all(:limit => 8).each do |user|
      45.times do
        if user.id.even?
          content = Faker::LoremCN.sentences(3)
        else
		  content = Faker::Lorem.sentences(3)
        end
        user.microposts.create!(:content => content)
      end
    end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end

