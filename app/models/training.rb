class Training < ActiveRecord::Base
  attr_accessible :date, :references, :remarks
  belongs_to :judge
end
