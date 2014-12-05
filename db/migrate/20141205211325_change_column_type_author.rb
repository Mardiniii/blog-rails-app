class ChangeColumnTypeAuthor < ActiveRecord::Migration
  def change
  	change_column :articles, :author, :integer
  end
end
