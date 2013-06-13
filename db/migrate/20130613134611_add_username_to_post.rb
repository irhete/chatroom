class AddUsernameToPost < ActiveRecord::Migration
  def change
    add_column :posts, :username, :string
    remove_column :posts, :user_id
  end
end
