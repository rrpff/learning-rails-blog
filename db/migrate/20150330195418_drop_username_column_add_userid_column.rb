class DropUsernameColumnAddUseridColumn < ActiveRecord::Migration
  def change
    remove_column :articles, :user, :string
    add_reference :articles, :user, index: true
  end
end