class Training < ActiveRecord::Base
  attr_accessible :date, :remarks
  belongs_to :judge
end
