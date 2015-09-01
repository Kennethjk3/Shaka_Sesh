class Invite < ActiveRecord::Base
  belongs_to :attended_meet, :class_name => "Meet"
  belongs_to :guest, :class_name => "User"

  validates :guest_id, presence: true
  validates :attended_id, presence: true
end
