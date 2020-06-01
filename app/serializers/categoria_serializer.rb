class CategoriaSerializer < ActiveModel::Serializer
  attributes :id,:nombre
  has_many :marcas
end
