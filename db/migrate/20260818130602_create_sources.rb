class CreateSources < ActiveRecord::Migration[7.2]
  def change
    create_table :sources do |t|
      t.references :biography, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.text :notes

      t.timestamps
    end
  end
end
