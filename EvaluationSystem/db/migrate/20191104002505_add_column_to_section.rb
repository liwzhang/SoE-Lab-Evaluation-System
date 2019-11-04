class AddColumnToSection < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :professor_email, :string
    remove_column :sections, :user_ID, :integer
  end
end
