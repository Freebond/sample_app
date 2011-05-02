require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_companies
    make_users
    make_microposts
    make_relationships
    make_categories
  end
end

def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :company_id => 1,
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    company_id = (1+n/10).round
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :company_id => company_id,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Lorem.sentence(5)
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

def make_categories
  theroot = Category.create!(:name => "categoria-root",
                             :parent_id => nil)

  99.times do |n|
    name  = "categoria-#{n+1}"
    parent_id = (1+n/10).round 
    Category.create!(:name => name,
                     :parent_id => parent_id)
  end
end

def make_companies
  10.times do |n|
    name  = Faker::Company.name
    duns = "A1B2C3D4E5-#{n+1}"
    address = Faker::Address.street_address
    city = Faker::Address.city
    zip = Faker::Address.zip_code
    province = Faker::Address.us_state_abbr
    country = "Italia"
    Company.create!(:name => name,
                 :duns => duns,
                 :address => address,
                 :city => city,
                 :zip => zip,
                 :province => province,
                 :country => country)
  end
end
