class CreateSteps < ActiveRecord::Migration[5.2]
  def up
    create_table :steps do |t|
      t.references :tutorial, foreign_key: true
      t.integer :no
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def down
    drop_table :steps
  end
end
