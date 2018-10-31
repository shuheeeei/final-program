class AddLikeCountToMeigens < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :meigens, :likes_count, :integer, default: 0
  end
end
