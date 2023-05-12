class JoinTablesMealAndProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :meals_products, id: false do |t|
      t.belongs_to :meals
      t.belongs_to :products
    end
  end
end
