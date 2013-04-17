class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def check_admin_access
    redirect_to expense_path() unless current_user.is_admin?
  end
end
