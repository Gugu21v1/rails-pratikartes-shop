class Post < ApplicationRecord
  validates :title, :body, :data, :autor, :img_url, presence: true
  has_one_attached :img_url
end
