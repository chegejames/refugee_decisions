class Judge < ActiveRecord::Base
  attr_accessible :date_of_training, :name, :trained
  has_many  :cases

  validates :name, presence: true
  JUDGES = Judge.all.map{|judge| [judge.name, judge.id]}

end
