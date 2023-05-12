class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age
      t.integer :weigh
      t.integer :sex
      t.string :region
      t.timestamps
    end
  end
end
