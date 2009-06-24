class CreateErrorReports < ActiveRecord::Migration
  def self.up
    create_table :error_reports do |t|
      t.integer  :error_group_id, :null => false
      t.datetime :time, :null => false
    end
  end

  def self.down
    drop_table :error_reports
  end
end
