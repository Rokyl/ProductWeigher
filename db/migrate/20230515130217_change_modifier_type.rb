class ChangeModifierType < ActiveRecord::Migration[7.0]
  def change
    change_column :portions, :portion_modifier, :float
    change_column :meals, :standard_portion_modifier, :float
  end
end
