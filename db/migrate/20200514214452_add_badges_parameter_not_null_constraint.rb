class AddBadgesParameterNotNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :badges, :parameter, false
  end
end
