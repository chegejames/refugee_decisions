class Judge < ActiveRecord::Base
  attr_accessible :name, :membership_id
  has_many :training_sessions
  has_many  :cases, inverse_of: :judge, dependent: :destroy
  has_many :trainings, :through => :training_sessions

  validates :membership_id, :name, presence: true


  JUDGES = Judge.all.map{|judge| [judge.name, judge.id]}

end
