class CreateErrorGroups < ActiveRecord::Migration
  def self.up
    create_table :error_groups do |t|
      t.string :location, :message
      t.integer :count
      t.datetime :latest
    end
  end

  def self.down
    drop_table :error_groups
  end
end
