class AddPointToPoints < ActiveRecord::Migration[5.1]
  def change
    add_column :points, :value, :integer
  end
end
