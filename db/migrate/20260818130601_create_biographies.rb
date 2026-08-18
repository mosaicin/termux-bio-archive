class CreateBiographies < ActiveRecord::Migration[7.2]
  def change
    create_table :biographies do |t|
      t.string :title
      t.string :slug
      t.text :summary
      t.text :body
      t.string :status, null: false, default: "draft"
      t.boolean :fictional, null: false, default: true
      t.string :author_name, null: false

      t.timestamps
    end
  end
end
