class CreateResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :responses do |t|
      t.references :biography, null: false, foreign_key: true
      t.string :name
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
