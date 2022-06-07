# frozen_string_literal: true

# Store top level book information
class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, index: true
      t.integer :pages
      t.string :isbn, index: true
      t.boolean :in_stock, default: false

      t.timestamps
    end
  end
end
