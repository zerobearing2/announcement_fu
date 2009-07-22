module AnnouncementHelper

  #------------------
  def current_announcements
    @current_announcements ||= Announcement.current_announcements( session[:announcement_hide_time] )
  end
  
  #------------------
  def display_announcements
    list = ""
    link = content_tag("p", link_to_remote(AnnouncementFu::Base.config[:hide_label], :url => "/announcements/hide"))
    unless current_announcements.empty?
      current_announcements.each {|a| list << content_tag("p", h(a.message)) }
      content_tag("div", (list + link), :id => "announcement")
    end
  end

end
