class ChangeColumnTypeAuthor < ActiveRecord::Migration
  def change
  	change_column :articles, :author, 'integer USING CAST(author AS integer)'
  end
end
