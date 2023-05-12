class JoinProfilesIngestionsAndPortions < ActiveRecord::Migration[7.0]
  def change
    add_column :ingestions, :profile_id, :bigint
    add_column :portions, :ingestion_id, :bigint
  end
end
