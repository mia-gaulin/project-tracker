class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.text :body, null: false
      t.belongs_to :project, null: false
      t.timestamps null: false
    end
  end
end
