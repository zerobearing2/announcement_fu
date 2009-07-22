require File.dirname(__FILE__) + '/test_helper.rb' 

class AnnouncementTest < Test::Unit::TestCase 
  load_schema 

  #------------------
  def test_announcement
    assert_kind_of Announcement, Announcement.new
  end
 
end 

