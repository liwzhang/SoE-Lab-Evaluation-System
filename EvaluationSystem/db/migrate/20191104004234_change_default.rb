class ChangeDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :sections, :completed, 0
  end
end
