class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.references :author, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.text :description
      t.datetime :published_date

      t.timestamps
    end
  end
end
