class ChangeExtraColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :merchants, :extra, :jsonb, default: '{ "phone": "", "website": "" }'
  end
end
