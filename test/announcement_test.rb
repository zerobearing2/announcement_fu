require File.dirname(__FILE__) + '/test_helper.rb' 

class AnnouncementTest < ActiveSupport::TestCase

  context "a announcement" do
    should "validate kind" do
      assert_kind_of Announcement, Announcement.new
    end
  end

end 

