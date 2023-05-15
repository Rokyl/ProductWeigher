class ChangeTypesProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :protein, :float
    change_column :products, :fat, :float
    change_column :products, :carbohydrates, :float
    change_column :products, :standard_portion_modifier, :float
  end
end
