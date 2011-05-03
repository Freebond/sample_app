class Company < ActiveRecord::Base

  attr_accessible :name, :duns, :address, :city, :zip, :province, :country
  has_many :users, :dependent => :destroy
  has_many :cpyrelationships, :foreign_key => "cpyfollower_id"
  has_many :cpyfollowing, :through => :cpyrelationships, :source => :cpyfollowed
  
  has_many :reverse_cpyrelationships, :foreign_key => "cpyfollowed_id",
                                   :class_name => "Cpyrelationship"
#                                   :class_name => "Cpyrelationship",
#                                   :dependent => :destroy
  has_many :cpyfollowers, :through => :reverse_cpyrelationships, :source => :cpyfollower  
  
  def cpyfollowing?(cpyfollowed)
    cpyrelationships.find_by_cpyfollowed_id(cpyfollowed)
  end

  def cpyfollow!(cpyfollowed)
    cpyrelationships.create!(:cpyfollowed_id => cpyfollowed.id)
  end
  
  def cpyunfollow!(cpyfollowed)
    cpyrelationships.find_by_cpyfollowed_id(cpyfollowed).destroy
  end
  
end
