class DashboardController < ApplicationController

  
  before_action :authenticate_user!
 
  #Admin dashboard
  # plus d'info: https://stackoverflow.com/questions/2919720/how-to-get-record-created-today-by-rails-activerecord
  def index
    @DashboardUserStudent = User.student.orderDesc
    @DashboardUserStudentDaily = @DashboardUserStudent.daily_sign_up
  end

  #Teacher dashboard
  def home
    @LevelList = Level.AllOrderDesc
    @MaterialList = Material.AllOrderDesc
  end

  
end
