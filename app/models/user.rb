class User < ActiveRecord::Base
  has_secure_password

  validates :email, confirmation: true, uniqueness: true
  validates :email_confirmation, presence: true

  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true
end
