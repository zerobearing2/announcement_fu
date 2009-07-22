require File.dirname(__FILE__) + '/test_helper.rb' 

class AnnouncementsControllerTest < ActionController::TestCase

  # def setup 
  #   ActionController::Routing::Routes.draw do |map| 
  #     map.resources :announcements  
  #   end  
  # end  
  
  def test_hide
    get :hide
    assert_response :success  
  end 
  
end 