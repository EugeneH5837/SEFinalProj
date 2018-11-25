class RemoveFromRoleSpecificLink < ActiveRecord::Migration[5.1]
  def change
    remove_column :role_specific_links, :correspondingRole, :integer
  end
end
