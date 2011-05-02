class Company < ActiveRecord::Base

  attr_accessible :name, :duns, :address, :city, :zip, :province, :country
  has_many :users, :dependent => :destroy

end
