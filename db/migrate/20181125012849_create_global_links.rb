class CreateGlobalLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :global_links do |t|
      t.string :link

      t.timestamps
    end
  end
end
