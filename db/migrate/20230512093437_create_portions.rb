class CreatePortions < ActiveRecord::Migration[7.0]
  def change
    create_table :portions do |t|
      t.integer :weigh
      t.integer :portion_modifier
      t.belongs_to :meal
      t.timestamps
    end
  end
end
