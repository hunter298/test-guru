class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false, default: 'bronze'
      t.string :quantity
      t.string :category
      t.string :level
      t.boolean :exact_test, null: false, default: false
      t.integer :test_id
      t.integer :attempts

      t.timestamps
    end
  end
end
