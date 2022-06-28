class CreateLandpages < ActiveRecord::Migration[7.0]
  def change
    create_table :landpages, id: :uuid do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.string :status

      t.timestamps
    end
  end
end
