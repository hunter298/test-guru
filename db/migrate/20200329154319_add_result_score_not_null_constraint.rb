class AddResultScoreNotNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :results, :score, false
  end
end
