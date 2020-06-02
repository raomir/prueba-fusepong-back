class CategoriaSerializer < ActiveModel::Serializer
  attributes :id, :nombre

  has_many :marcas
  has_many :categoria_productos
  has_many :productos, through: :categoria_productos
end
