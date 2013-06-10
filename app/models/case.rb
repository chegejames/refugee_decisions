class Case < ActiveRecord::Base
  belongs_to :judge
  belongs_to :cause
  attr_accessible :accused, :case_number, :complainant, :court, :defendant, :state, :summary_of_decision, :year_of_judgement
  validates :year_of_judgement, :case_number, :court, :summary_of_decision, presence: true
 # validates :defendant, :complainant, presence: true, :if => :civil_case?
 # validates :state, :accused, presence: true, :if => :criminal_case?

  def civil_case?
    true
  end

  def criminal_case?
    true
  end
end
