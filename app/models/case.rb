class Case < ActiveRecord::Base
  belongs_to :judge
  belongs_to :cause
  attr_accessible :accused, :case_number, :complainant, :court, :defendant, :state, :summary_of_decision, :year_of_judgement
end
