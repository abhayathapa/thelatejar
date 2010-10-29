class CreateJars < ActiveRecord::Migration
  def self.up
    create_table :jars do |t|
      t.integer :user_id
      t.float "fine_amount"
      t.timestamps "end_date", :default => :null
      t.timestamps
    end
  end

  def self.down
    drop_table :jars
  end
end
