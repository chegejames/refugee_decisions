class Cause < ActiveRecord::Base
  attr_accessible :category, :description, :name
  has_many :cases

  CATEGORIES = ["civil", "criminal"]
  CAUSES = Array.new
  Cause.all.each{|x| CAUSES << [x.name+" ( "+x.category+" )", x.id]}

  validates :category, :description, :name, presence: true
end
