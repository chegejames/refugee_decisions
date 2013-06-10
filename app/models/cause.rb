class Cause < ActiveRecord::Base
  attr_accessible :category, :description, :name
  has_many :cases

  CATEGORIES = ["civil", "criminal"]

  validates :category, :description, :name, presence: true
end
