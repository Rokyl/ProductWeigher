class DeleteRepeatedFields < ActiveRecord::Migration[7.0]
  def change
    remove_column :portions, :portion_modifier
  end
end
