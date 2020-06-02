class ProductoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :tipo_producto, :descripcion, :visible, :score, :referencia, 
             :precio, :cantidad,  :on_sale, :precio_anterior, :composicion

  belongs_to :marca
  has_many :categoria_productos, if: -> { should_show_categories }
  has_many :categoriums, through: :categoria_producto

  def should_show_categories
    @instance_options[ :show_productos ]
  end
end
