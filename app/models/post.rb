class Post < ApplicationRecord
  has_many :comments
  has_one_attached :photo
  validates :title, presence: true
  validates :content, presence: true
end
