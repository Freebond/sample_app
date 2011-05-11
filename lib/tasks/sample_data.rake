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
    make_cpyrelationships
  end
end

def make_users
  admin = User.create!(:name => "Bond",
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
  User.all(:limit => 12).each do |user|
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
  20.times do |n|
    if (n==0) then
      name  = "ACME"
    else
      name  = Faker::Company.name
    end
    duns = "A1B2C3D4E5-#{n+1}"
    address = Faker::Address.street_address
    city = Faker::Address.city
    zip = Faker::Address.zip_code
    province = Faker::Address.us_state_abbr
    country = "Italia"
    if (n==4) or (n%6==0) then
      blacklist = true
    else
      blacklist = false
    end
    if (n==3) or (n==5) then
      whitelist = true
    else
      whitelist = false
    end
    Company.create!(:name => name,
                 :duns => duns,
                 :address => address,
                 :city => city,
                 :zip => zip,
                 :province => province,
                 :country => country,
                 :blacklist => blacklist,
                 :whitelist => whitelist)
  end

  def make_cpyrelationships
    companies = Company.all
    company  = companies.first
    cpyfollowing = companies[1..15]
    cpyfollowers = companies[3..12]
    cpyfollowing.each { |cpyfollowed| company.cpyfollow!(cpyfollowed) }
    cpyfollowers.each { |cpyfollower| cpyfollower.cpyfollow!(company) }
  end

end
