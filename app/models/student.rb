class Student < ActiveRecord::Base
  belongs_to :user
  validates :name, :age, :password, presence: true
end
