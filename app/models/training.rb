class Training < ActiveRecord::Base
  attr_accessible :name, :date, :remarks, :report
  has_many :training_sessions
  has_many :judges, :through => :training_sessions
   has_attached_file :report
end
