class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index  :merchants, :extra, using: :gin
  end
end
