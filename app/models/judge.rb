class Judge < ActiveRecord::Base
  attr_accessible :name, :membership_id, :designation
  has_many :training_sessions, dependent: :destroy
  has_many  :cases, inverse_of: :judge, dependent: :destroy
  has_many :trainings, :through => :training_sessions

  validates :membership_id, :designation, :name, presence: true
  validates :membership_id, :numericality => { :only_integer => true }, :uniqueness => true


  JUDGES = Judge.all.map{|judge| [judge.name, judge.id]}
  DESIGNATIONS = ["JUSTICE", "HON"]

end
