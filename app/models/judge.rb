class Judge < ActiveRecord::Base
  attr_accessible :date_of_training, :first_name, :last_name, :trained
  has_many  :cases

  JUDGES = Array.new
  begin
    Judge.all.each do | judge |
      JUDGES << [judge.first_name + " " + judge.last_name, judge.id]
    end
  end
  validates :first_name, :last_name, presence: true

end
