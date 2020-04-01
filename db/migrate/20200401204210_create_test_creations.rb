class CreateTestCreations < ActiveRecord::Migration[6.0]
  def change
    create_table :test_creations do |t|
      t.references :creation, null: false, foreign_key: false
      t.references :creator, null: false, foreign_key: false

      t.timestamps
    end
  end
end
