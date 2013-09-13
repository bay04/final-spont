class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :category_of_work
      t.decimal :budget

      t.timestamps
    end
  end
end
