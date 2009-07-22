module AnnouncementHelper

  #------------------
  def current_announcements
    @current_announcements ||= Announcement.current_announcements( session[:announcement_hide_time] )
  end
  
  #------------------
  def display_announcements
    list = header = ""
    link = content_tag("p", link_to_remote(AnnouncementFu::Base.config[:hide_label], :url => "/announcements/hide"))
    header = content_tag("h1", AnnouncementFu::Base.config[:header]) unless AnnouncementFu::Base.config[:header].blank?
    unless current_announcements.empty?
      current_announcements.each {|a| list << content_tag("p", h(a.message)) }
      content_tag("div", (header + list + link), :id => "announcement")
    end
  end

end
