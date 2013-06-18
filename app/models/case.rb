class Case < ActiveRecord::Base
  belongs_to :judge, inverse_of: :cases
  belongs_to :cause
  attr_accessible :accused, :case_number, :complainant, :court, :defendant, :state, :summary_of_decision, :year_of_judgement, :pdf

  has_attached_file :pdf

  validates_associated :judge, :cause
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
