class AddExtraFieldsAsString < ActiveRecord::Migration[7.0]
  def change
    add_column :merchants, :phone, :string
    add_column :merchants, :website, :string
  end
end
