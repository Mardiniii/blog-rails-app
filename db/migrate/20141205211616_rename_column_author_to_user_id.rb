class RenameColumnAuthorToUserId < ActiveRecord::Migration
  def change
  	rename_column :articles, :author, :user_id
  end
end
