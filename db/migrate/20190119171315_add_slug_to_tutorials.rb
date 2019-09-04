class AddSlugToTutorials < ActiveRecord::Migration[5.2]
  def up
    add_column :tutorials, :slug, :string
  end

  def down 
    remove_column :tutorials, :slug
  end
end
