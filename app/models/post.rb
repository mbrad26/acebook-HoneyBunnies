class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates_presence_of :message
end
