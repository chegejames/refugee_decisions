class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  def home
  end

  def about_us
  end

  def programmes
  end

  def contact_us
  end

  def reports
  end
end
