class AddDefaultLevelToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :level, 0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
