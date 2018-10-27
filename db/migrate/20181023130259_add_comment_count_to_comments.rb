class AddCommentCountToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :meigens, :comments_count, :integer, default: 0
  end
end

