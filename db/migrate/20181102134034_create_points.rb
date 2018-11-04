class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.references :user, foreign_key: true
      t.references :meigen, foreign_key: true
      t.timestamps
    end
  end
end
