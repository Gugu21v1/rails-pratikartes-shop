class Produto < ApplicationRecord
  validates :nome, :foto, :valor, :desc, :autor, :tipo_produto, presence: true
  has_one_attached :foto
end
