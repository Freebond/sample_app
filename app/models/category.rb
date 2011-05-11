class Category < ActiveRecord::Base
  acts_as_nested_set
  
  attr_accessible :id, :name, :parent_id
  
  def self.roots
    self.find(:all, :conditions=>["parent_id = ?", 0])
  end

  def level
    self.ancestors.size
  end  
  
end
