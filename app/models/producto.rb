class Producto < ApplicationRecord
    belongs_to :marca
    has_many :categoria_producto

end
