class CreateMarcas < ActiveRecord::Migration[6.0]
  def change
    create_table :marcas do |t|
      t.string :nombre, :limit => 150
      t.string :descripcion, :limit => 500
      t.string :slogan, :limit => 150
      t.string :ciudad, :limit => 150
      t.string :departamento, :limit => 150
      t.string :pais, :limit => 150
      t.boolean :visible
      t.string :color_principal, :limit => 150
      t.string :color_secundario, :limit => 150
      t.json :social_media
      t.string :email
      t.integer :radio_de_cobertura
      t.references :categorium, foreign_key: true
      t.timestamps
    end
  end
end
