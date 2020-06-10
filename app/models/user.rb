class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  has_secure_password
  validates :fname, :lname, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validate :image_type
  #
  # private
  #
  # def image_type
  #    if image.attached? == false
  #      errors.add(:image, "is missing!")
  #    end
  #    if !image.content_type.in?(%('image/jpeg image/png image/ico'))
  #      errors.add(:image, "needs to be a jpeg or png!")
  #    end
  # end

end
