class Company < ActiveRecord::Base

  attr_accessible :name, :duns, :address, :city, :zip, :province, :country, :whitelist, :blacklist
  has_many :users, :dependent => :destroy
  has_many :cpyrelationships, :foreign_key => "cpyfollower_id"
  has_many :cpyfollowing, :through => :cpyrelationships, :source => :cpyfollowed
  
  has_many :reverse_cpyrelationships, :foreign_key => "cpyfollowed_id",
                                   :class_name => "Cpyrelationship"

  has_many :cpyfollowers, :through => :reverse_cpyrelationships, :source => :cpyfollower  

  def cpyfollowing?(cpyfollowed)
    cpyrelationships.find_by_cpyfollowed_id(cpyfollowed)
  end

  def cpyfollow!(cpyfollowed)
    cpyrelationships.create!(:cpyfollowed_id => cpyfollowed.id)
  end
  
  def cpyunfollow!(cpyfollowed)
    cpyrelationships.find_by_cpyfollowed_id(cpyfollowed).destroy
    send_email
  end 
  
TPMI_SMTP_OPTIONS = {
    :address        => 'smtp.sendgrid.net',
    :port           => '25',
    :user_name      => 'app502271@heroku.com',
    :password       => 'd9f41c17eccad318f9',
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain         => ENV['SENDGRID_DOMAIN'] # the HELO domain provided by the client to the server
}

def send_email
  
  Pony.mail(:to => 'paolo.granata@i-faber.com', :from => 'massimo.bondanza@i-faber.com',
    :subject => "Rimozione albo fornitori di ACME",
    :html_body => '<b>Rimozione albo fornitori di ACME<b><br /> Cordiali saluti, Massimo',
    :via => :smtp, :via_options => TPMI_SMTP_OPTIONS)

  Pony.mail(:to => 'annamaria.ricco@i-faber.com', :from => 'massimo.bondanza@i-faber.com',
    :subject => "Rimozione albo fornitori di ACME",
    :html_body => '<b>Rimozione albo fornitori di ACME<b><br /> Cordiali saluti, Massimo',
    :via => :smtp, :via_options => TPMI_SMTP_OPTIONS)

   Pony.mail(:to => 'sergio.perego@i-faber.com', :from => 'massimo.bondanza@i-faber.com',
    :subject => "Rimozione albo fornitori di ACME",
    :html_body => '<b>Rimozione albo fornitori di ACME<b><br /> Cordiali saluti, Massimo',
    :via => :smtp, :via_options => TPMI_SMTP_OPTIONS)

  Pony.mail(:to => 'marcello.galli@i-faber.com', :from => 'massimo.bondanza@i-faber.com',
    :subject => "Rimozione albo fornitori di ACME",
    :html_body => '<b>Rimozione albo fornitori di ACME<b><br /> Cordiali saluti, Massimo',
    :via => :smtp, :via_options => TPMI_SMTP_OPTIONS)

end
    
end
