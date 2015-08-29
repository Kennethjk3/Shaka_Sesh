class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_attached_file :avatar,
  styles: {  thumb: "100x100>", square: '200x200#', medium: "300x300>" },
  default_url: "/images/:style/missing.png"
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/aws.yml",
  :path => "resources/:id/:style/:basename.:extension"
validates_attachment_content_type :avatar,
  content_type: /\Aimage\/.*\Z/

end
