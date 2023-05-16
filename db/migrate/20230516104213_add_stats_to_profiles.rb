class AddStatsToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :BMR, :integer
    change_column :profiles, :weigh, :float
    add_column :profiles, :height, :float
    add_column :profiles, :activity, :integer, default: 1
    add_column :profiles, :target, :integer, default: 2
  end
end
