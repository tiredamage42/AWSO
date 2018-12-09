class AddSuperadminToAuthor < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :superadmin, :boolean
  end
end
