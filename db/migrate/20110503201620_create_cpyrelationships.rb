class CreateCpyrelationships < ActiveRecord::Migration
  def self.up
    create_table :cpyrelationships do |t|
      t.integer :cpyfollower_id
      t.integer :cpyfollowed_id
      t.timestamps
    end
    add_index :cpyrelationships, :cpyfollower_id
    add_index :cpyrelationships, :cpyfollowed_id
    add_index :cpyrelationships, [:cpyfollower_id, :cpyfollowed_id], :unique => true
  end

  def self.down
    drop_table :cpyrelationships
  end
end
