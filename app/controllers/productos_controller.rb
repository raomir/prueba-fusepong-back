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
    @producto
    producto_params['producto'].each do |n|
      @data = armarJsonProducto(n)
      @producto = guardarProductos(@data, n[:categorias])
    end
    render json: @producto
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.where(marca_id: params[:id])
      return @producto
    end

    def set_categoria (nombre)
      @categorias = Categorium.where(nombre: nombre)
      if @categorias.exists? then 
        return @categorias.first
      else
        return false
      end
    end

    # Only allow a trusted parameter "white list" through.
    def producto_params
      params.permit(
        data: {
          producto: [ 
            :id, :nombre, :tipo_producto, :descripcion, :visible, :score, :referencia, 
            :precio, :cantidad,  :on_sale, :precio_anterior, :marca_id, :composicion, :categorias]
          }
        ).require(:data)
    end

    # Se valida primero si ya se encuentra un producto con el nombre del producto
    # si es así, entonces se actualiza el dato
    # de lo contrario, se crea uno nuevo
    def guardarProductos (data, categoria_producto)
      begin
        @producto = Producto.where(nombre: data[:nombre])

        if @producto.exists? then
          if @producto.update(data) then
            @producto = @producto.first[:id]
            return actualizarCategoriasProductos(@producto, categoria_producto)
          else
            return 'No se pudo actualizar el producto'
          end
        else 
          CategoriaProducto.transaction do
            @categoriaProducto
            @producto = Producto.new(data)

            if @producto.save() then
              return guardarCategoriasProductos(@producto[:id], categoria_producto)
            else
              return 'No se pudo registrar el producto'
            end
          end
        end
      rescue ActiveRecord::RecordNotSaved => e
        raise ActiveRecord::Rollback
        return e
      rescue ActiveRecord::RecordInvalid => e
        raise ActiveRecord::Rollback
        return e
      end
    end

    # Se arma el json con los ids del producto y de la categoria para guardarlos en la tabla
    # categoria_productos y luego se procede a guardar los datos
    def guardarCategoriasProductos (idProducto, categoria_producto)
      begin
        CategoriaProducto.transaction do
            @cat = JSON.parse(categoria_producto)
            @cat.each do |categoria|
              @categoriasProductos = armarDatos(categoria, idProducto)
                if @categoriasProductos != false then
                  @categoriaProducto = CategoriaProducto.new(@categoriasProductos)
                  if @categoriaProducto.save() then 
                    @message = 'Registro satisfactorio'
                  end
                else 
                  return 'No se encontró la categoría' + ' ' + categoria + ' registrada'
                end
              end
              return 'Registro satisfactorio'
          end
        end
      rescue ActiveRecord::RecordNotSaved => e
        raise ActiveRecord::Rollback
        return e
      rescue ActiveRecord::RecordInvalid => e
        raise ActiveRecord::Rollback
        return e
      end
    end

    # Se valida primero si ya existe la categoria con el producto registrado
    # si es así, entonces se actualiza 
    # de lo contrario, se registra una nueva categoría
    def actualizarCategoriasProductos (idProducto, categoria_producto)
      begin
        CategoriaProducto.transaction do
          @message
          @cat = JSON.parse(categoria_producto)
          @cat.each do |categoria|
            @categoria_productos = CategoriaProducto.where(producto_id: idProducto, categorium: set_categoria(categoria))
            if @categoria_productos.exists? then
              @categoriasProductos = armarDatos(categoria, idProducto)
              if @categoriasProductos != false then
                if @categoria_productos.update(@categoriasProductos) then 
                  @message = 'Registro actualizado satisfactorio'
                else
                  return 'No se pudo actualizar las categorías del producto'
                end
              else 
                return 'No se encontró la categoría' + ' ' + categoria + ' registrada'
              end
            else
              @categoriasProduct = armarDatos(categoria, idProducto)
              if @categoriasProduct != false then
                @registerCategoriaProducto = CategoriaProducto.new(@categoriasProduct)
                if @registerCategoriaProducto.save() then 
                  @message = 'Registro satisfactorio'
                else
                  return 'No se pudo registrar las categorías del producto'
                end 
              else
                return 'No se encontró la categoría' + ' ' + categoria + ' registrada'
              end
            end
          end
          return @message
        end
      rescue ActiveRecord::RecordNotSaved => e
        raise ActiveRecord::Rollback
        return e
      rescue ActiveRecord::RecordInvalid => e
        raise ActiveRecord::Rollback
        return e
      end
    end

    # Método que se encarga de validar si existe la categoría mediante el nombre
    # si es así, arma el array con el producto y la categoría 
    # de lo contrario devuelve un false
    def armarDatos (categoria, idProducto)
      @idCategoria = set_categoria(categoria)
      if @idCategoria != false then
        return @data = {producto_id: idProducto, categorium_id: @idCategoria[:id]}
      else
        return false
      end
    end

    def armarJsonProducto (data)
      @data = {
        cantidad: data[:cantidad], composicion: data[:composicion], descripcion: data[:descripcion],
        marca_id: data[:marca_id], nombre: data[:nombre], on_sale: data[:on_sale], precio: data[:precio],
        precio_anterior: data[:precio_anterior], referencia: data[:referencia], score: data[:score],
        tipo_producto: data[:tipo_producto], visible: data[:visible]
      }
      return @data
end
