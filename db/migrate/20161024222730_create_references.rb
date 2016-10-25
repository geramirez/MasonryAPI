class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :name
      t.string :path
      t.string :kind
      t.references :component, foreign_key: true

      t.timestamps
    end
  end
end
