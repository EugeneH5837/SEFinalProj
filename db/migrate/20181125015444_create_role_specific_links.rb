class CreateRoleSpecificLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :role_specific_links do |t|
      t.string :link
      t.integer :correspondingRole

      t.timestamps
    end
  end
end
