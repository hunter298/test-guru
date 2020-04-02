class AddTestsCreatorIdNotNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :creator_id, false
  end
end
