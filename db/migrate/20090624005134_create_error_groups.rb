class CreateErrorGroups < ActiveRecord::Migration
  def self.up
    create_table :error_groups do |t|
      t.string :location, :message, :null => false
      t.integer :count, :default => 0, :null => false
      t.datetime :latest
    end
  end

  def self.down
    drop_table :error_groups
  end
end
