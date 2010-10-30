class SettingsController < ApplicationController
  
  #before_filter :check_account
  before_filter :require_user
  
  def index
      @account = Account.find(current_account)
      @days = Account.days.sort
  end
  
  def update

    off_days = params[:office_closing_days]
    
    @account = Account.find(params[:id])
    @account.office_closing_days = off_days if ! off_days.nil?

    if @account.update_attributes(params[:account]) 
      redirect_to '/', :notice => 'Setting was successfully updated.'
    else
      redirect_to settings_path
    end
  end
  
end
