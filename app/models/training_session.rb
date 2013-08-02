class TrainingSession < ActiveRecord::Base
  belongs_to :judge
  belongs_to :training
  attr_accessible :judge_id, :training_id, :date, :judge_tokens

  attr_reader :judge_tokens
  def judge_tokens=(ids)
    ids.split(",")
  end


end
