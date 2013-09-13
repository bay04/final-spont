class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :profile_type

      t.timestamps
    end
  end
end
