class Training < ActiveRecord::Base
  attr_accessible :name, :date, :remarks, :report, :publish
  has_many :training_sessions, dependent: :destroy
  has_many :judges, :through => :training_sessions
  has_attached_file :report

  validates :name, :date, :remarks, :report, presence: :true
  scope :publish?, where(:publish => true)

  def create_training_sessions(trained_on, judges_tokens, location)
    training = self
    judges= Judge.find(judges_tokens.split(","))
    judges.each do |judge|
      training.training_sessions.create(:judge_id => judge.id, :date => trained_on, :location => location)
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
