class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :update, :destroy]

  # GET /productos
  def index
    @productos = Producto.all

    render json: @productos
  end

  # GET /productos/1
  def show
    render json: @producto
  end

  # POST /productos
  def create
    #Se registra las categorias
    @categoria
    producto_params['categoria'].each.with_index do |n|
      @categoria = guardarCategorias(n)
    end

    if @categoria then
      #Se registra las marcas
      @marca
      producto_params['marca'].each do |n|
        @marca = guardarMarcas(n)
      end

      if @marca then
        #Se registra los productos
        
        @producto
        producto_params['producto'].each do |n|
          @producto = guardarProductos(n)
        end

        if @producto then
          #Se registra las categorias_productos
          @categoriaProducto
          producto_params['categoria_producto'].each do |n|
            @categoriaProducto = guardarCategoriasProductos(n)
          end
  
          if @categoriaProducto then
            render json: true, status: :created
          else
            render json: 'error en categorias productos'
          end
        else
          render json: 'error en productos'
        end
      else
        render json: 'error en marca'
      end
    else
      render json: 'error en categoria'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.where(marca_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def producto_params
      params.permit(
        data: {
          categoria: [ :id,:nombre ],
          producto: [ 
            :id, :nombre, :tipo_producto, :descripcion, :visible, :score, :referencia, 
            :precio, :cantidad,  :on_sale, :precio_anterior, :marca_id, :composicion, :categoria_id],
          marca: [
            :id, :nombre, :descripcion, :slogan, :ciudad, :departamento, :pais, :visible,
            :color_principal, :color_secundario, :email, :radio_de_cobertura, :categorium_id, :social_media
          ],
          categoria_producto: [:id, :categorium_id, :producto_id]
        }
        ).require(:data)
    end

    # Se valida primero si ya se encuentra una categoria con el mismo id
    # si es así, entonces se actualiza el dato
    # de lo contrario, se crea uno nuevo
    def guardarCategorias (data)
      begin
        @categoria = Categorium.find(data[:id])
        return @categoria.update(data)
      rescue ActiveRecord::RecordNotFound
        @categorium = Categorium.new(data)
        return @categorium.save
      end
    end

    # Se valida primero si ya se encuentra una marca con el mismo id
    # si es así, entonces se actualiza el dato
    # de lo contrario, se crea uno nuevo
    def guardarMarcas (data)
      begin
        @marca = Marca.find(data[:id])
        return @marca.update(data)
      rescue ActiveRecord::RecordNotFound
        @marca = Marca.new(data)
        return @marca.save
      end
    end

    # Se valida primero si ya se encuentra un producto con el mismo id
    # si es así, entonces se actualiza el dato
    # de lo contrario, se crea uno nuevo
    def guardarProductos (data)
      begin
        @producto = Producto.find(data[:id])
        return @producto.update(data)
      rescue ActiveRecord::RecordNotFound
        @producto = Producto.new(data)
        return @producto.save
      end
    end

    # Se valida primero si ya se encuentra una categoria_producto con el mismo id
    # si es así, entonces se actualiza el dato
    # de lo contrario, se crea uno nuevo
    def guardarCategoriasProductos (data)
      begin
        @categoriaProducto = CategoriaProducto.find(data[:id])
        return @categoriaProducto.update(data)
      rescue ActiveRecord::RecordNotFound
        @categoriaProducto = CategoriaProducto.new(data)
        return @categoriaProducto.save
      end
    end
end
