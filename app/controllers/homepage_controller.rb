class HomepageController < ApplicationController
 
  def index
    redirect_to feed_path if user_signed_in? && set_home_feed == "feed"
    redirect_to welcome_path if user_signed_in? && set_home_feed == "welcome"
  end

  private

  def set_home_feed
    if current_user.status == "Students" && current_user.welcomes.none?
      return "welcome"
    else
      return "feed"
    end
  end

end
