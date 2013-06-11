class RenamePasswordInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :passwordhash, :password_digest
  end
end
