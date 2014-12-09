class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :comments, :commenter, 'integer USING CAST(commenter AS integer)'
  end
end
