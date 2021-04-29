class User < ActiveRecord::Base

  validates :email, confirmation: true
  validates :email_confirmation, presence: true

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
