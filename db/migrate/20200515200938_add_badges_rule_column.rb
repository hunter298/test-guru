class AddBadgesRuleColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :rule, :string, null: false
    rename_column :badges, :parameter, :rule_value
    change_column_null :badges, :rule_value, false
  end
end
