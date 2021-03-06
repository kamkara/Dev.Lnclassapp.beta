class DashboardController < ApplicationController

  
  before_action :authenticate_user!
 
  #Admin dashboard
  # plus d'info: https://stackoverflow.com/questions/2919720/how-to-get-record-created-today-by-rails-activerecord
  def index
    @DashboardUserStudent = User.student.orderDesc
    @DashboardUserStudentDaily = @DashboardUserStudent.daily_sign_up
    @UserMember = @DashboardUserStudent.membership
    @UserFormPartner = @DashboardUserStudent.where("referral_in = ?", current_user.referral_out)

    @UserFronPhilo = @DashboardUserStudent.partnership_ref_philo
    @UserFromBacIvoire = @DashboardUserStudent.partnership_ref_ivoire
  end

  #Teacher dashboard
  def home
    @LevelList = Level.allOrderDesc
    @MaterialList = Material.allOrderDesc
  end

  
end
