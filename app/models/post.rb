class Post < ApplicationRecord
  has_many :comments
  belongs_to :category
  has_one_attached :photo
  validates :title, presence: true
  validates :content, presence: true
end
