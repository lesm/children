class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :students

  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['name']
      user.location = auth_hash['info']['location'] || 'Oaxaca de Juarez'
      user.image_url = auth_hash['info']['image'] || 'www.image.com'
      user.url = "www.#{auth_hash['provider']}.com"
      user.email = auth_hash['info']['email'] || "email@gmail.com"
      user.password = Devise.friendly_token[0,20] 
      user.save!
      user
    end
  end

end
