class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :ceo, :servicos, :sobre ]

  def home
    @posts = Post.first(9)
    @produtos = Produto.where(tipo_produto: "Curso")
  end

  def ceo
  end

  def servicos
  end

  def sobre
  end
end
