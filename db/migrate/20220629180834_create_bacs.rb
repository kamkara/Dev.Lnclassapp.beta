class CreateBacs < ActiveRecord::Migration[7.0]
  def change
    create_table :bacs, id: :uuid do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.string :linked

      t.timestamps
    end
  end
end
