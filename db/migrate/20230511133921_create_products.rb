class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :barcode
      t.integer :kcal
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrates
      t.integer :standard_portion_modifier
      t.timestamps
    end
  end
end
