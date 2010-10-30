class JarsController < ApplicationController
  before_filter :return_jars
  def index
    @users = @jars.compact.map{|jar| jar.user }
    @users.uniq!
    
    @total_amount = 0
    @jars.each do |jar|
      @total_amount += jar.fine_amount
    end
    
    @max = @users.first.jars.maximum(:created_at)
    @min = @users.first.jars.minimum(:created_at)
    @users.each do |user|
      @max = user.jars.maximum(:created_at) if user.jars.maximum(:created_at) > @max  
      @min = user.jars.minimum(:created_at) if user.jars.minimum(:created_at) < @min
    end
    
    diff = @max - @min
    mm, ss = diff.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    if dd == 1
      @last_days = "#{dd} day."
    else
      @last_days = "#{dd} days."
    end
    # puts "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
  end
  
  def reset_contrib
    @jars.each{|jar| jar.end_date = Time.now}
    redirect_to root_url, :notice => "All contributions reset"
  end

  private
  def return_jars
    @jars = current_account.users.map{|user| user.jars.where("end_date is null")}.flatten
  end
end
