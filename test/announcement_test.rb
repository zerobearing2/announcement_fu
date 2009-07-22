require File.dirname(__FILE__) + '/test_helper.rb' 

class AnnouncementTest < Test::Unit::TestCase 

  context "a announcement" do
    setup do
      load_schema
    end
    should "validate kind" do
      assert_kind_of Announcement, Announcement.new
    end
  end

end 

