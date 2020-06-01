class ProductoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :tipo_producto, :descripcion, :visible, :score, :referencia, 
             :precio, :cantidad,  :on_sale, :precio_anterior, :composicion

  belongs_to :marca
  has_many :categoria_producto, if: -> { should_show_categorias }

  def should_show_categorias
    @instance_options[ :categorias ]
  end
end
