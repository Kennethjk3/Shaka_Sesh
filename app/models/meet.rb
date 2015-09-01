class Meet < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
	has_many :guests, through: :invites, dependent: :destroy
	has_many :invites, :foreign_key => 'attended_id', dependent: :destroy

  scope :upcoming, -> meet_date { where("meet_date >= ?", Date.today).order("meet_date ASC") }
	scope :past, -> meet_date { where("meet_date < ?", Date.today).order("meet_date DESC") }


	validates :name, presence: true, length: { maximum: 40 }
	validates :description, presence: true, length: {minimum: 5}
	# validates :address, presence: true, length: { minimum: 3}
	# validates :meet_date, presence: true
	# validates :meet_time, presence: true
	# validate :meet_date_cannot_be_in_the_past

end
