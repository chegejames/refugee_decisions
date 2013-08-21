class TrainingSession < ActiveRecord::Base
  belongs_to :judge
  belongs_to :training
  attr_accessible :judge_id, :training_id, :end_date, :start_date, :judge_tokens, :location
  has_attached_file :original_list
  validates :end_date , :start_date, :location, presence: true

  attr_reader :judge_tokens
  def judge_tokens=(ids)
    ids.split(",")
  end


end
