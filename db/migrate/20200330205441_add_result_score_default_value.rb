class AddResultScoreDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :results, :score, from: nil, to: 0
  end
end
