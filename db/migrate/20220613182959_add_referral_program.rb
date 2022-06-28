class AddReferralProgram < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :referral_in, :string
    add_column :users, :referral_out, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
