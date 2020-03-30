class AddResultAttributesNotNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :results, :user_id, false
    change_column_null :results, :test_id, false
    change_column_null :results, :score, false
  end
end
