class AddToRoleSpecificLink < ActiveRecord::Migration[5.1]
  def change
    add_column :role_specific_links, :role_id, :integer
  end
end
