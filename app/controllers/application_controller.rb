class ApplicationController < ActionController::Base
  def set_admin_timezone
    Time.zone = 'Eastern Time (US & Canada)'
  end
end
