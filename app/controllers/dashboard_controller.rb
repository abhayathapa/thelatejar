class DashboardController < ApplicationController
  before_filter :require_user
  before_filter :check_account
  
  def index
      insert_fine_to_jar
      
      Time.zone = current_account.time_zone
      @current_time = Time.zone.now
      @raised_amount = 0
      @today_contributors = []
      @top_contributors = []
     
      
      @users = current_account.users
      @users.each do |user|
         dt = user.jars.where("end_date is null").order("created_at DESC").first.created_at.to_date if !user.jars.empty?
         @today_contributors << user if dt == Date.today
      end
      
      @users.each do |user|
        sum = user.jars.where(:end_date => nil).sum(:fine_amount)
        @top_contributors << [sum ,user.name ] if sum != 0
      end
      @top_contributors= @top_contributors.sort.reverse
     
      @jars = current_account.users.map{|user| user.jars.where("end_date is null")}.flatten
      @total_amount = 0
      @jars.each do |jar|
        @total_amount += jar.fine_amount
        #@today_contributors << jar.user.name(jar.created_at.day == Time.now.day )
      end      
      
      if current_user.roles && current_user.roles.include?("site_admin") && current_user.sign_in_count <= 2 && current_account.users.count == 1
        @msg= "Please change your settings and start a campaign."
      end
  end
  
  def check_account
    if current_user
      check_my_account(current_user.account.name)
    end
  end 
   
  #insert fine amount to jar
  def insert_fine_to_jar
    return if current_user.id == current_account.user_id  # for account owner
    return if current_account.late_after.hour > Time.zone.now.hour
    return if current_account.late_after.min >= Time.zone.now.min
    dt = current_user.jars.order("created_at DESC").first.created_at.to_date if !current_user.jars.empty?
    return if dt == Date.today
      @late = true
      jar = current_user.jars.new
      jar.fine_amount = current_account.fine_amount
      jar.save 
  end
    
end
