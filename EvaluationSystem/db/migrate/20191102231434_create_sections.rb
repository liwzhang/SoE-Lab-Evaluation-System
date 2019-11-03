class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :class_num
      t.integer :user_ID
      t.integer :enrolled
      t.integer :completed
      t.text :subject
      t.text :catalog
      t.text :title
      t.integer :section

      t.timestamps
    end
    add_index :sections, :class_num, unique: true
  end
end
