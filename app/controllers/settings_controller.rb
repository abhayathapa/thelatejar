class SettingsController < ApplicationController
  
  #before_filter :check_account
  before_filter :require_user
  
  def index
      @account = Account.last
      #@account = Account.find(current_account)
  end
  
  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account]) 
      redirect_to '/', :notice => 'Setting was successfully updated.'
    else
      redirect_to settings_path
    end
  end
  
end
