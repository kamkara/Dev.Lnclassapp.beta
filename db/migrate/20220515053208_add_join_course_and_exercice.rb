class AddJoinCourseAndExercice < ActiveRecord::Migration[7.0]
  def change
    create_join_table :courses, :exercices, column_options: { null: false, type: :uuid}
  end
end
