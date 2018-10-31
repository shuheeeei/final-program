class CreateMeigens < ActiveRecord::Migration[4.2][5.1]
  def change
    create_table :meigens do |t|
      t.text :content, null: false
      t.text :scene
      t.string :image
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
