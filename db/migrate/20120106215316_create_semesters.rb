class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
