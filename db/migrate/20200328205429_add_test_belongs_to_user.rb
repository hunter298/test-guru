class AddTestBelongsToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, null: true, foreign_key: true
  end
end
