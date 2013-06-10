class Judge < ActiveRecord::Base
  attr_accessible :date_of_training, :first_name, :last_name, :trained
  has_many  :cases

  JUDGES = Array.new

  Judge.all.each do | judge |
    JUDGES.append [judge.first_name + " " + judge.last_name, judge.id]
  end
  validates :first_name, :last_name, presence: true

end
