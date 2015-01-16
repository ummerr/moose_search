class User < ActiveRecord::Base
  has_many :searches

  has_secure_password

  validates :email, uniqueness: :true
end
