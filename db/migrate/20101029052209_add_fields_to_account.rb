class AddFieldsToAccount < ActiveRecord::Migration
  def self.up
    change_table "accounts" do |t|
      t.string "time_zone"
      t.string "ip_range"
      t.string "office_closing_days"
      t.float "fine_amount"
      t.integer "late_after"
    end
  end

  def self.down
      remove_column :accounts, "time_zone"
      remove_column :accounts, "ip_range"
      remove_column :accounts, "office_closing_days"
      remove_column :accounts, "fine_amount"
      remove_column :accounts, "late_after"
  end
end
