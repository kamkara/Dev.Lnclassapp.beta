class PageController < ApplicationController

  before_action :set_course
  #before_action :authenticate_user!, only: %i[index]


  def index
  @PageCourses = Course.all
  end

  def show
   
  end

  private

  def set_course
    
  end
end
