class Category < ActiveRecord::Base

  attr_accessible :categoryname, :parent_id

#Behaviours
  acts_as_nested_set
  
# Validations
  validates_presence_of :categoryname
  validates_uniqueness_of :categoryname
  
end
