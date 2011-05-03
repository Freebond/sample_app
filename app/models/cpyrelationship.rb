class Cpyrelationship < ActiveRecord::Base
  attr_accessible :cpyfollowed_id
  
  belongs_to :cpyfollower, :class_name => "Company"
  belongs_to :cpyfollowed, :class_name => "Company"
  
  validates :cpyfollower_id, :presence => true
  validates :cpyfollowed_id, :presence => true
    
end
