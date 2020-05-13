class AddAttemtpToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :attempt, :integer
  end
end
