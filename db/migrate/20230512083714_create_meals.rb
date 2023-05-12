class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.integer :weigh
      t.float :total_kcal
      t.float :total_carbohydrates
      t.float :total_fat
      t.float :total_proteins
      t.integer :standard_portion_modifier
      t.timestamps
    end
  end
end
