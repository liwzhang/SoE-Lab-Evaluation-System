class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :question_ID
      t.text :category
      t.text :type
      t.text :content

      t.timestamps
    end
    add_index :questions, :question_ID, unique: true
  end
end
