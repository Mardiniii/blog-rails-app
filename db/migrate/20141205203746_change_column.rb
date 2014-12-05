class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :comments, :commenter, :integer
  end
end
