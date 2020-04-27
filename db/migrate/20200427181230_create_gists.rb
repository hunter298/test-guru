class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :gist_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
