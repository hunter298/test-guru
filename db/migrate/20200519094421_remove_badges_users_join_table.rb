class RemoveBadgesUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :badges, :users
  end
end
