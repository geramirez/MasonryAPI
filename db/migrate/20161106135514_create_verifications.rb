class CreateVerifications < ActiveRecord::Migration[5.0]
  def change
    create_table :verifications do |t|
      t.string :name
      t.string :key
      t.string :path
      t.string :kind
      t.timestamps
    end

    create_table :components_verifications, id: false do |t|
      t.belongs_to :component, index: true
      t.belongs_to :verification, index: true
    end

  end
end
