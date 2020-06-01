class CategoriaProductosController < ApplicationController
  before_action :set_categoria_producto, only: [:show, :update, :destroy]

  # GET /categoria_productos
  def index
    @categoria_productos = CategoriaProducto.all

    render json: @categoria_productos
  end

  # GET /categoria_productos/1
  def show
    render json: @categoria_producto, categorias: true
  end

  # POST /categoria_productos
  def create
    @categoria_producto = CategoriaProducto.new(categoria_producto_params)

    if @categoria_producto.save
      render json: @categoria_producto, status: :created, location: @categoria_producto
    else
      render json: @categoria_producto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categoria_productos/1
  def update
    if @categoria_producto.update(categoria_producto_params)
      render json: @categoria_producto
    else
      render json: @categoria_producto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categoria_productos/1
  def destroy
    @categoria_producto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_producto
      @categoria_producto = CategoriaProducto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def categoria_producto_params
      params.fetch(:categoria_producto, {})
    end
end
