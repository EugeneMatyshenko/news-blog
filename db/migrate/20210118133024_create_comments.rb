class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.string :text
      t.string :entity_id
      t.string :entity_type
      t.date :date
      t.timestamps
    end
  end
end
