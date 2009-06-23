class CreateErrors < ActiveRecord::Migration
  def self.up
    create_table :errors do |t|
      t.string :controller
      t.string :action
      t.string :exception_type
      t.string :message
      t.string :url
      t.string :request_type
      t.text :stack_trace
      t.text :env_vars
      t.text :session
      t.text :params
      t.string :hostname
      t.integer :pid

      t.timestamps
    end
  end

  def self.down
    drop_table :errors
  end
end
