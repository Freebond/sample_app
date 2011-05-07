class AddWhiteBlackListToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :whitelist, :boolean
    add_column :companies, :blacklist, :boolean
  end

  def self.down


    remove_column :companies, :blacklist



    remove_column :companies, :whitelist


  end
end
