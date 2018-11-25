class CreateMylinks < ActiveRecord::Migration[5.1]
  def change
    create_table :mylinks do |t|
      t.string :link

      t.timestamps
    end
  end
end
