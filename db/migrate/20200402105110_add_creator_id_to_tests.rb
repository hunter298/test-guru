class AddCreatorIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :creator, null: true, foreign_key: {to_table: :users}
  end
end
