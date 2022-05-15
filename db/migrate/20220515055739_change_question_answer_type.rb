class ChangeQuestionAnswerType < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :answer, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
