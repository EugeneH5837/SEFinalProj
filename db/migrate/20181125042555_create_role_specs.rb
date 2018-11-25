class CreateRoleSpecs < ActiveRecord::Migration[5.1]
  def change
    create_table :role_specs do |t|
      t.string :link
      t.integer :role_id

      t.timestamps
    end
  end
end
