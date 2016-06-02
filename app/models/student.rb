class Student < ActiveRecord::Base
  has_secure_password
  
  belongs_to :user

  validates :name, :birthdate, :username, presence: true
  validates :password, length: { minimum: 6 }, if: :password
  validates_confirmation_of :password
  validates_uniqueness_of :username

  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"  }, default_url: "/avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
