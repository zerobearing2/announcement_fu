class AnnouncementsController < ApplicationController

  #------------------
  def hide
    session[:announcement_hide_time] = Time.now.utc
    render :update do |page|
      page[:announcement].hide
    end
  end

end
