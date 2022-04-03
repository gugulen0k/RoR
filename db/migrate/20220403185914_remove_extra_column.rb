class RemoveExtraColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :merchants, :extra
  end
end
