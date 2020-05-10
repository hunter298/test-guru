class ChangeBadgeQuantityToBeInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :badges, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end
