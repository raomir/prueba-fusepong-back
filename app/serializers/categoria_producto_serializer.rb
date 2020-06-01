class CategoriaProductoSerializer < ActiveModel::Serializer
  attributes :id, :categorium_id, :producto_id

  belongs_to :categorium, if: -> { should_show_categories }
  belongs_to :producto, if: -> { should_show_productos }

  def should_show_categories
    @instance_options[ :categorias ]
  end

  def should_show_productos
    @instance_options[ :productos ]
  end
end
