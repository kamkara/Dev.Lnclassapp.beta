class DashboardController < ApplicationController
  before_action :authenticate_user!
 
  #Admin dashboard
  # plus d'info: https://stackoverflow.com/questions/2919720/how-to-get-record-created-today-by-rails-activerecord
  def index
    @DashboardUserStudent = User.where("status = ?", "Student").order("created_at desc")
    @DashboardUserStudentDaily = @DashboardUserStudent.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  #Teacher dashboard
  def home
    @LevelList = Level.all.order('created_at desc')
    @MaterialList = Material.all.order('created_at desc')
  end

  
end
