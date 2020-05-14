class ResultsTableMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.float :result_value
      t.references :competition, foreign_key: true
      t.references :athlete, foreign_key: true
      t.timestamps
    end
  end
end
