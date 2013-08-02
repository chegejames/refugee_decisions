class Training < ActiveRecord::Base
  attr_accessible :name, :date, :remarks, :report, :publish
  has_many :training_sessions
  has_many :judges, :through => :training_sessions
  has_attached_file :report

  scope :publish?, where(:publish => true)

  def create_training_sessions(judges_tokens, trained_on)
    training = self
    judges= Judge.find(judges_tokens.split(","))
    judges.each do |judge|
      training.training_sessions.create(:judge_id => judge.id, :date => trained_on)
    end
  end

  def publish
    training = self
    training.update_column(:publish, true)
  end

  def retract
    training = self
    training.update_column(:publish, false)
  end
end
