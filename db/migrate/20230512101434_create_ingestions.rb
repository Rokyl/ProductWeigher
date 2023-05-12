class CreateIngestions < ActiveRecord::Migration[7.0]
  def change
    create_table :ingestions do |t|
      t.integer :status
      t.belongs_to :portions
      t.timestamp :eated_at
      t.timestamps
    end
  end
end
