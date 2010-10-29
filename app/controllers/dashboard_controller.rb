class DashboardController < ApplicationController
  before_filter :check_account
  before_filter :require_user
  
  def index
      Time.zone = current_account.time_zone
      @current_time = Time.zone.now
      @raised_amount = 0
      @today_contributors = []
      @top_contributors = []
      
      if current_user.roles.include?("site_admin") && current_user.sign_in_count == 2 && current_account.users.count == 1
        redirect_to edit_account_setting_path(current_account)
      end
  end
  
  def check_account
    if current_user
      check_my_account(current_user.account.name)
    end
  end 
end
