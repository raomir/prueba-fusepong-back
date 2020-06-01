class CreateProductos < ActiveRecord::Migration[6.0]
  def change
    create_table :productos do |t|  
      t.string :nombre, :limit => 150
      t.string :tipo_producto, :limit => 150
      t.string :descripcion, :limit => 500
      t.boolean :visible
      t.float :score
      t.string :referencia, :limit => 150
      t.float :precio
      t.integer :cantidad
      t.boolean :on_sale
      t.float :precio_anterior
      t.json :composicion
      t.references :marca, foreign_key: true
      t.timestamps
    end
  end
end
