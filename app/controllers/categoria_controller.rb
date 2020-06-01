class CategoriaController < ApplicationController
  before_action :set_categorium, only: [:show, :update, :destroy]

  # POST /categoria
  def create
    @text
    @marca
    categorium_params['data']['marcas'].each do |n|
      @marca = Marca.create(n)
      @text = @marca.save
    end
    if @text
      render json: @marca, status: :created, location: @marca
    else
      render json: @marca.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorium
      @categorium = Categorium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def categorium_params
      params.permit(
        data: {
          categorias: [ :id,:nombre ],
          productos: [ 
            :id, :nombre, :tipo_producto, :descripcion, :visible, :score, :referencia, 
            :precio, :cantidad,  :on_sale, :precio_anterior, :marcas_id, :categoria_id, :composicion],
          marcas: [
            :id, :nombre, :descripcion, :slogan, :ciudad, :departamento, :pais, :visible,
            :color_principal, :colo_secundario, :email, :radio_de_cobertura, :categoria_id, :social_media
          ]
        }
        )
    end

    def guardarCategorias (data)
      begin
        @categoria = Categorium.find(data[:id])
        @categoria.update(data)
      rescue ActiveRecord::RecordNotFound
        @categorium = Categorium.new(data)
        @categorium.save
      end
    end

    def guardarMarcas (data)
      begin
        @marca = Marca.find(data[:id])
        @marca.update(data)
      rescue ActiveRecord::RecordNotFound
        @marca = Marca.new(data)
        @marca.save
      end
    end
end
