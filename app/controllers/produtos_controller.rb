class ProdutosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @produtos = Produto.all
  end

  def show
    @produtos = Produto.last(3)
    @produto = Produto.find(params[:id])
  end

  def new
    @produto = Produto.new
    if current_user.admin == false
      redirect_to root_path
      flash[:alert] = "Somente Admins podem fazer criação de novos produtos."
    end
  end

  def create
    @produto = Produto.new(produto_params)
    if @produto.save
      redirect_to produto_path(@produto)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @produto = Produto.find(params[:id])
  end

  def update
    @produto = Produto.find(params[:id])
    if @produto.update(produto_params)
      redirect_to produto_path(@produto)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy
    redirect_to produtos_path
  end

  private

  def produto_params
    params.require(:produto).permit(:tipo_produto, :tipo_curso, :foto, :nome, :valor, :modulos, :autor, :desc)
  end
end
