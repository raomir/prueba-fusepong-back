class CategoriaProducto < ApplicationRecord
    belongs_to :categorium
    belongs_to :producto
end
