class User < ActiveRecord::Base
  has_many :meets, :foreign_key => "creator_id", dependent: :destroy
	has_many :invites, :foreign_key => "guest_id", dependent: :destroy
	has_many :attended_meets, through: :invites, dependent: :destroy

  has_attached_file :avatar,
                    styles: { thumb: ["100x100#", :jpg],
                              square: ["200x200#", :jpg],
                              medium: ["300x300#", :jpg],
                              original: ['500x500>', :jpg] }, :default_url => "/images/missing.png",
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 85 -strip" },
                   storage: :s3,
                   s3_credentials: {
                     access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                     secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
                   },
                   bucket: ENV["AWS_S3_BUCKET"]

validates_attachment :avatar,
content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
