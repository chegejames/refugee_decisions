class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter set_request_format

  def set_request_format
    if is_mobile_devise?
      request.format = :mobile
    else
      request.format =:html
    end
  end

  has_mobile_fu



end
