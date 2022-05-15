class HomepageController < ApplicationController
  def index
    redirect_to feed_path if user_signed_in?
  end
end
