class TrainingSession < ActiveRecord::Base
  belongs_to :judge
  belongs_to :training
  attr_accessible :judge_id, :training_id, :date
end
