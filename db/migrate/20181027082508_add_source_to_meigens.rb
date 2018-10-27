class AddSourceToMeigens < ActiveRecord::Migration[5.1]
  def change
    add_column :meigens, :source, :string
  end
end
