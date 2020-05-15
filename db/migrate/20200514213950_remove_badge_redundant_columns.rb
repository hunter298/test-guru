class RemoveBadgeRedundantColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :badges, :quantity
    remove_column :badges, :category
    remove_column :badges, :level
    remove_column :badges, :exact_test
    remove_column :badges, :test_id
    remove_column :badges, :attempts
    add_column :badges, :parameter, :string
  end
end
