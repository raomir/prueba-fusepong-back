class MarcaSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion, :slogan, :ciudad, :departamento, :pais, :visible,
             :color_principal, :color_secundario, :email, :radio_de_cobertura, :social_media

  has_many :productos, if: -> { should_show_productos }
  belongs_to :categorium

  def should_show_productos
    @instance_options[ :show_producto ]
  end
end
