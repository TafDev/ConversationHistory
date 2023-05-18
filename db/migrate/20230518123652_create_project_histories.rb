class CreateProjectHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :project_histories do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :event_type
      t.text :event_body

      t.timestamps
    end
  end
end
