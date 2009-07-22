require File.dirname(__FILE__) + '/test_helper.rb' 

class AnnouncementFuTest < ActiveSupport::TestCase
  
  def test_schema_has_loaded_correctly 
    assert_equal [], Announcement.all 
  end 
  
end
