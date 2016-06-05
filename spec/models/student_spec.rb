require 'rails_helper'

RSpec.describe Student, type: :model do
  it { validate_presence_of :name }
  it { validate_presence_of :birthdate }
  it { validate_presence_of :username }
  it { validate_uniqueness_of :username }
  it { validate_presence_of :password}
end
