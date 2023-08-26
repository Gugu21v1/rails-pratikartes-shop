class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :ceo, :servicos, :sobre ]

  def home
    @posts = Post.last(9)
    @produtos = Produto.where(tipo_produto: "Curso")
  end

  def ceo
    @posts = Post.last(3)
    @produtos = Produto.where(tipo_produto: "Curso")
  end

  def servicos
  end

  def sobre
  end

  def admin
    if current_user.admin == false
      redirect_to root_path
      flash[:alert] = "Somente Admins podem acessar o painel."
    end
  end
end
