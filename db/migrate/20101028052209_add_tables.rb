class AddTables < ActiveRecord::Migration
  def self.up
    create_table "accounts", :force => true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "time_zone"
      t.string   "ip_range"
      t.string   "office_closing_days"
      t.float    "fine_amount"
      t.integer  "late_after"
    end

    add_index "accounts", ["name"], :name => "index_accounts_on_name"

    create_table "jars", :force => true do |t|
      t.integer  "user_id"
      t.float    "fine_amount"
      t.datetime "end_date"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users", :force => true do |t|
      t.string   "email",                               :default => "", :null => false
      t.string   "encrypted_password",   :limit => 128, :default => ""
      t.string   "password_salt",                       :default => ""
      t.string   "reset_password_token"
      t.string   "remember_token"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",                       :default => 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "account_id"
      t.string   "loginable_token"
      t.string   "invitation_token",     :limit => 20
      t.datetime "invitation_sent_at"
      t.string   "login"
      t.string   "roles"
    end

    add_index "users", ["account_id"], :name => "index_users_on_account_id"
    add_index "users", ["email"], :name => "index_users_on_email", :unique => true
    add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
    add_index "users", ["loginable_token"], :name => "index_users_on_loginable_token"
    add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end
  
  def self.down
    drop_table :jars
    drop_table :users
    drop_table :accounts
  end
end