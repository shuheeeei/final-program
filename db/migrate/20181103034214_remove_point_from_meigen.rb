class RemovePointFromMeigen < ActiveRecord::Migration[5.1]
  def change
    remove_column :meigens, :point
  end
end
