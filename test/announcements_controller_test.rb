require File.dirname(__FILE__) + '/test_helper.rb' 

class AnnouncementsControllerTest < ActionController::TestCase

  context "get hide" do
    setup do
      get :hide
    end
    should_respond_with :success
  end

end 