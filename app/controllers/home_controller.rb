class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[team]
  before_action :Enable_Level, 
                :Enable_Material
  
  def index
    @FeedCourses = Course.all.order('created_at desc')
    @FeedExercices  =  Course.all
  end

  def team
  end
  
  private
    def Enable_Level
      @FeedLevels =  Level.all.order('created_at desc')
    end

    def Enable_Material
      @FeedMaterials =  Material.all.order('created_at desc')
    end

end
