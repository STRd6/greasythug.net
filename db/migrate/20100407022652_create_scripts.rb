class CreateScripts < ActiveRecord::Migration
  def self.up
    create_table :scripts do |t|
      t.references :creator, :null => false
      t.string :domain, :null => false
      t.string :title, :null => false
      t.text :code, :null => false

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :scripts
  end
end
