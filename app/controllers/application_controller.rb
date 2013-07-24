class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  has_mobile_fu
  before_filter :set_request_format

  def set_request_format
    request.format = :mobile if is_mobile_device?
  end

end
