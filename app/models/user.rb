class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                   styles: { thumb: ["100x100#", :jpg],
                             square: ["200x200#", :jpg],
                             medium: ["300x300#", :jpg],
                             original: ['500x500>', :jpg] },
                   convert_options: { thumb: "-quality 75 -strip",
                                      original: "-quality 85 -strip" },
                  storage: :s3,
                  s3_credentials: {
                    access_key_id: ENV["AWS_KEY"],
                    secret_access_key: ENV["AWS_SECRET"]
                  },
                  bucket: "shakasesh-profile"

  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
