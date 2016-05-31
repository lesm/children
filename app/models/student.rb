class Student < ActiveRecord::Base
  belongs_to :user
  validates :name, :birthdate, :password, presence: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"  }, default_url: "/avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
