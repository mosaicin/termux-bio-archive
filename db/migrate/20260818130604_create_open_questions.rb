class CreateOpenQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :open_questions do |t|
      t.references :biography, null: false, foreign_key: true
      t.text :prompt
      t.string :status

      t.timestamps
    end
  end
end
