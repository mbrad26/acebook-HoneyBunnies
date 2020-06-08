class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_secure_password
  validates :fname, :lname, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
