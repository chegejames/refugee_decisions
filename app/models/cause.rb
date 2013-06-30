class Cause < ActiveRecord::Base
  attr_accessible :category, :description, :name
  has_many :cases

  CATEGORIES = ["civil", "criminal"]
  COURTS = ["Milimani Law Courts", "Commercial & Tax Division - Milimani Law Courts", "Busia Law Courts", "Eldoret Law Courts", "Embu Law Courts", "Garissa Law Courts", "Garsen Law Courts", "Githunguri Law Courts", "Hola Law Courts", "Homabay Law Courts", "Kakamega Law Courts", "Kaloleni Law Courts", "Kangundo Law Courts", "Kericho Law Courts", "Kerugoya Law Courts", "Kiambu Law Courts", "Kibera Law Courts", "Kilifi Law Courts", "Kilungu Law Courts", "Kisumu Law Courts", "Kitale Law Courts", "Kwale Law Courts", "Lamu Law Courts", "Lodwar Law Courts", "Machakos Law Courts", "Makadara Law Courts", "Malindi Law Courts", "Mariakani Law Courts", "Mavoko Law Courts", "Meru Law Courts", "Mombasa Law Courts", "Murang'a Law Courts", "Nakuru Law Courts", "Nyeri Law Courts", "Siaya Law Courts", "Tawa Law Courts", "Thika Law Courts", "Tononoka Law Courts", "Ukwala Law Courts", "Voi Law Courts", "Wundanyi Law Courts"]
  CAUSES = []
  Cause.all.each{|c| CAUSES << c.name}

  validates :category, :description, :name, presence: true
end
