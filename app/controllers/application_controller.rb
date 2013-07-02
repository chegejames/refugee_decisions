class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :is_mobile_device?

  before_filter :is_tablet_device?

  has_mobile_fu



end
