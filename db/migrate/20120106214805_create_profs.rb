class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
