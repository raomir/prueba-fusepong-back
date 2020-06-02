class Producto < ApplicationRecord
    belongs_to :marca
    
    has_many :categoria_productos
    has_many :categoriums, through: :categoria_productos

end
