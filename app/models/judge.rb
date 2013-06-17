class Judge < ActiveRecord::Base
  attr_accessible :date_of_training, :name, :trained
  has_many  :cases, inverse_of: :judge, dependent: :destroy

  validates :name, presence: true
  validates :date_of_training, presence: true, :unless => :untrained?
  validates :date_of_training, length: {is: 0}, :if => :untrained?

  def trained?
    trained == true
  end

  def untrained?
    trained == false
  end

  JUDGES = Judge.all.map{|judge| [judge.name, judge.id]}

end
