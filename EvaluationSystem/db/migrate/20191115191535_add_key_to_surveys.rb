class AddKeyToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :key, :string
  end
end
