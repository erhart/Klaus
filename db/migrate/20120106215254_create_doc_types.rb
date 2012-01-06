class CreateDocTypes < ActiveRecord::Migration
  def change
    create_table :doc_types do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
