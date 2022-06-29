class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.text :content
      t.integer :position, index: true, default: 0
      t.boolean :is_published, index: true, default: false

      t.timestamps
    end
  end
end
