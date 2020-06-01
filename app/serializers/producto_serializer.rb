class ProductoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :tipo_producto, :descripcion, :visible, :score, :referencia, 
             :precio, :cantidad,  :on_sale, :precio_anterior, :composicion

  belongs_to :marca
  has_many :categorium, if: -> { should_show_categorias }

  def should_show_categorias
    @instance_options[ :show_categorias ]
  end
end
