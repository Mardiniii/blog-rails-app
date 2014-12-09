class ChangeColumnTypeAuthor < ActiveRecord::Migration
  def change
  	Article.update_all(author: nil)
  	change_column :articles, :author, 'integer USING CAST(author AS integer)'
  end
end
