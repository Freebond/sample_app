class Category < ActiveRecord::Base
  act_as_nested_set
  attr_accessible :categoryname
end
