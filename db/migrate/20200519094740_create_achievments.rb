class CreateAchievments < ActiveRecord::Migration[6.0]
  def change
    create_table :achievments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
