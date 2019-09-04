class CreateTagProgrammings < ActiveRecord::Migration[5.2]
  def up
    create_table :tag_programmings do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :tag_programmings
  end
end
