class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :id
      t.string :name
      t.references :lesson
      t.references :semester
      t.references :prof
      t.references :doc_type

      t.timestamps
    end
    add_index :documents, :lesson_id
    add_index :documents, :semester_id
    add_index :documents, :prof_id
    add_index :documents, :doc_type_id
  end
end
