class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :key
      t.boolean :documentation_complete
      t.string :schema_version
      t.timestamps
    end
  end
end
