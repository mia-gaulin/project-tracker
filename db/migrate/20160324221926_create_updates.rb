class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :body, null: false
      t.belongs_to :project, null: false
      t.timestamps null: false
    end
  end
end
