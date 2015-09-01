class Meet < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
	has_many :guests, through: :invites, dependent: :destroy
	has_many :invites, :foreign_key => 'attended_event_id', dependent: :destroy



	validates :name, presence: true, length: { maximum: 40 }
	validates :description, presence: true, length: {minimum: 5}
	# validates :location, presence: true, length: { minimum: 3}
	# validates :event_date, presence: true
	# validates :start_time, presence: true
	# validate :event_date_cannot_be_in_the_past

end
