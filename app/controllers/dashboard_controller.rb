class DashboardController < ApplicationController
  def index
      Time.zone = current_account.time_zone
      @current_time = Time.zone.now
      @raised_amount = 0
      @today_contributors = []
      @top_contributors = []
  end
end
