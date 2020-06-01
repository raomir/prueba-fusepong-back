class CreateCategoria < ActiveRecord::Migration[6.0]
  def change
    create_table :categoria do |t|
      t.string :nombre, :limit => 150
      t.timestamps
    end
  end
end
