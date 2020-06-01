class Marca < ApplicationRecord
    has_many :productos
    belongs_to :categorium
end
