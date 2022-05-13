class CreateCityEreas < ActiveRecord::Migration[7.0]
  def change
    create_table :city_ereas, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
