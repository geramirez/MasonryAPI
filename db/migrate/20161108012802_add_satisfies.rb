class AddSatisfies < ActiveRecord::Migration[5.0]
  def change
    create_table :satisfies do |t|
      t.string :standard_key
      t.string :control_key
      t.references :component, forign_key: true

      t.timestamps
    end
  end
end
