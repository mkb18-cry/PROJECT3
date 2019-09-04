class CreateTutorials < ActiveRecord::Migration[5.2]
  def up
    create_table :tutorials do |t|
      t.references :user, foreign_key: true
      t.references :tag_programming, foreign_key: true
      t.string :title

      t.timestamps
    end
  end

  def down
    drop_table :tutorials
  end
end
