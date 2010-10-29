class DashboardController < ApplicationController
  before_filter :check_account
  before_filter :require_user
  
  def index
      Time.zone = current_account.time_zone
      @current_time = Time.zone.now
      @raised_amount = 0
      @today_contributors = []
      @top_contributors = []
  end
  
  def check_account
    if current_user
      check_my_account(current_user.account.name)
    end
  end 
end
