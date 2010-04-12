class AddGuidToScripts < ActiveRecord::Migration
  def self.up
    add_column :scripts, :guid, :string

    Script.find_each do |script|
      script.send(:set_guid)
      script.save!
    end

    change_column :scripts, :guid, :string, :null => false

    add_index :scripts, :guid, :unique => true
  end

  def self.down
    remove_column :scripts, :guid
  end
end
