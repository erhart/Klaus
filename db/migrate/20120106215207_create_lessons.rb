class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
