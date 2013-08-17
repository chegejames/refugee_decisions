class Case < ActiveRecord::Base
  belongs_to :judge
  belongs_to :cause
  attr_accessible :judge_id, :cause_id, :accused, :case_number, :complainant, :court, :defendant, :state, :summary_of_decision, :year_of_judgement, :pdf

  has_attached_file :pdf

  validates :year_of_judgement, :case_number, :court, :summary_of_decision, :pdf, presence: true
  validates_presence_of :judge
  validates_presence_of :cause

  validates :defendant, :complainant, presence: true, :if => :civil_case?
  #validates :state, :accused, presence: true, :if => :criminal_case?

  def civil_case?
    if cause_id.present?
      Cause.find_by_id(cause_id).category == "civil"
    else
      return
    end
  end

  def criminal_case?
    if cause_id.present?
      Cause.find_by_id(cause_id).category == "criminal"
     else
      return
    end
  end

  COURTS = ['Supreme court',
 'Milimani law courts',
 'City court',
 'Milimani commercial court',
 'Makadara law courts',
 'Kibera law courts',
 'Kisumu law courts',
 'Winam law courts',
 'Maseno law courts',
 'Siaya law courts',
 'Bondo law courts',
 'Ukwala law courts',
 'Nyando law courts',
 'Tamu law courts',
 'Homa-bay law courts',
 'Ndhiwa law courts',
 'Migori law  courts',
 'Rongo law courts',
 'Oyugis law courts',
 'Kisii law courts',
 'Nyamira  law courts',
 'Ogembo law courts',
 'Keroka  law courts',
 'Kehancha  law  courts',
 'Kakamega law courts',
 'Mumias  law courts',
 'Butere law courts',
 'Butali law courts',
 'Vihiga law courts',
 'Hamisi law courts',
 'Bungoma law  courts',
 'Webuye  law courts',
 'Kimilili law courts',
 'Sirisia law courts',
 'Busia law courts',
 'Nakuru law courts',
 'Naivasha law courts',
 'Engineer court',
 'Molo law courts',
 'Eldoret law courts',
 'Kapsabet law  court courts',
 'Kitale law courts',
 'Kericho law  courts',
 'Sotik law courts',
 'Bomet law courts',
 'Iten law courts',
 'Kabarnet law courts',
 'Eldama-ravine law courts',
 'Narok law courts',
 'Kilgoris law courts',
 'Kajiado law courts',
 'Kapenguria law courts',
 'Maralal law courts',
 'Lodwar law courts',
 'Kakuma law courts',
 'Nanyuki law courts',
 'Nyahururu law courts',
 'Nyeri law  courts',
 'Othaya law courts',
 'Karatina law courts',
 'Mukurweini law courts',
 "Murang'a law courts",
 'Kangema law courts',
 'Kigumo law courts',
 'Thika law courts',
 'Gatundu law courts',
 'Kandara law courts',
 'Kiambu law courts',
 'Githunguri law courts',
 'Kikuyu law courts',
 'Limuru law  courts',
 'Kerugoya law courts',
 'Baricho law courts',
 'Gichugu law courts',
 "Wang'uru law courts",
 'Embu law courts',
 'Runyenjes law courts',
 'Siakago law courts',
 'Meru law courts',
 'Chuka law courts',
 'Marimanti law courts',
 'Nkubu law courts',
 'Maua law courts',
 'Tigania law courts',
 'Machakos law courts',
 'Mavoko law courts',
 'Kithimani law courts',
 'Kangundo court',
 'Tawa law courts',
 'Makueni law courts',
 'Kilungu law courts',
 'Makindu law courts',
 'Kitui law courts',
 'Mutomo law courts',
 'Mwingi law courts',
 'Kyuso law courts',
 'Marsabit law courts',
 'Isiolo law courts',
 'Moyale law courts',
 'Mombasa law courts',
 'Malindi law courts',
 'Garsen law courts',
 'Kaloleni law courts',
 'Kilifi law courts',
 'Voi law courts',
 'Mariakani court',
 'Wundanyi law courts',
 'Shanzu law courts',
 'Taveta law courts',
 'Kwale law courts',
 'Lamu law courts',
 'Hola law courts',
 'Garissa law courts',
 'Wajir law courts',
 'Mandera law courts']

end
