class Categorium < ApplicationRecord
    has_many :marcas
    has_many :categoria_producto
end
