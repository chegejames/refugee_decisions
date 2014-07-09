class PagesController < ApplicationController
  def home
    @news = News.all
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
