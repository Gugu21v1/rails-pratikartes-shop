class Post < ApplicationRecord
  validates :title, :body, :data, :img_url, presence: true
  has_one_attached :img_url
end
