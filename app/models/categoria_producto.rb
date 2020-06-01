class CategoriaProducto < ApplicationRecord
    has_many :categoriums
    has_many :productos
end
