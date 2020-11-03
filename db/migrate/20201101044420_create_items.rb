class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text     :name, null: false
      t.text       :text, null: false
      t.string     :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
