class ChangeTheDataTypeOfLateAfter < ActiveRecord::Migration
  def self.up
    change_column :accounts, :late_after, :time, :default=> "09:00"
  end

  def self.down
    change_column :accounts, :late_after, :integer,:default=> 0
  end
end
