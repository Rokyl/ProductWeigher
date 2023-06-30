class ChangeRegionTypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :region, :string
  end
end
