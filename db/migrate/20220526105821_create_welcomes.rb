class CreateWelcomes < ActiveRecord::Migration[7.0]
  def change
    create_table :welcomes, id: :uuid do |t|
      t.string :math
      t.string :pc
      t.string :svt
      t.string :hg
      t.string :fr
      t.string :ang
      t.string :philo
      t.string :all_esp
      t.text :student_message
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
