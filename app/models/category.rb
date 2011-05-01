class Category < ActiveRecord::Base
  acts_as_nested_set
  
  attr_accessible :id, :name, :parent_id
end
