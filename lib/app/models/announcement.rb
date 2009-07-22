class Announcement < ActiveRecord::Base 
  set_table_name AnnouncementFu::Base.config[:table]
  before_validation :convert_times_to_utc

  #------------------
  def self.clear
    delete_all
  end
  
  #------------------
  def self.current_announcements(hide_time)
    hide_time = hide_time.utc unless hide_time.nil? || hide_time.utc?
    with_scope :find => { :conditions => ["starts_at <= ? AND ends_at >= ?", Time.now.utc, Time.now.utc] } do
      if hide_time.nil?
        find(:all)
      else
        find(:all, :conditions => ["updated_at > ? OR starts_at > ?", hide_time, hide_time])
      end
    end
  end
  
  
  ###############
  protected
  ###############
  
  #------------------
  def convert_times_to_utc
    starts_at = starts_at.utc unless starts_at.nil? || starts_at.utc?
    ends_at = ends_at.utc unless ends_at.nil? || ends_at.utc?
  end

end 