class Judge < ActiveRecord::Base
  attr_accessible :name
  has_many :training_sessions
  has_many  :cases, inverse_of: :judge, dependent: :destroy
  has_many :trainings, :through => :training_sessions

  validates :name, presence: true


  JUDGES = Judge.all.map{|judge| [judge.name, judge.id]}

end
