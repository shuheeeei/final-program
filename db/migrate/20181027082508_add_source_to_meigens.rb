class AddSourceToMeigens < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :meigens, :source, :string
  end
end
