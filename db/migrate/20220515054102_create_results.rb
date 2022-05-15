class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :exercice, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
