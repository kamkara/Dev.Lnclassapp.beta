class PageController < ApplicationController

  #before_action :authenticate_user!, only: %i[index]


  def index
  @PageCourse = Course.all
  end

  def show
  end
end
