class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :city
      t.string :street
      t.integer :country_code
      t.jsonb :extra, null: false, default: '{ "phone": "", "website": "" }'

      t.timestamps
    end
    add_index  :merchants, :extra, using: :gin
  end
end
