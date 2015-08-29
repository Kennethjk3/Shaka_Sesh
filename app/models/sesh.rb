class Sesh < ActiveRecord::Base
  has_attached_file :image,
                    styles: { thumb: ["64x64#", :jpg],
                              original: ['500x500>', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 85 -strip" },
                   storage: :s3,
                   s3_credentials: {
                     access_key_id: ENV["AWS_KEY"],
                     secret_access_key: ENV["AWS_SECRET"]
                   },
                   bucket: "shakasesh-images"

validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
