class AddColumnNumberOfCommentsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :number_of_comments, :integer
  end
end
