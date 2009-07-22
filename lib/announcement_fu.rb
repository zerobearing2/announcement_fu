require "announcement_fu/routing" 

# AnnouncementFu
module AnnouncementFu
  class Base
    @@config = {
      :table => "announcements",
      :header => "Attention:",
      :hide_label => "[x] close"
    }
    cattr_accessor :config
  end
end

# Adding directories to the load path makes them appear just like files in
# the the main app directory – except that they are only loaded once, so
# you have to restart the web server to see the changes in the browser.
# Removing directories from the ‘load_once_paths’ allow those changes to
# picked up as soon as you save the file – without having to restart the
# web server. This is particularly useful as you develop the plugin.
%w{ models controllers helpers }.each do |dir| 
  path = File.join(File.dirname(__FILE__), 'app', dir)  
  $LOAD_PATH << path 
  ActiveSupport::Dependencies.load_paths << path 
  ActiveSupport::Dependencies.load_once_paths.delete(path) if RAILS_ENV=="development"
end 

module ApplicationHelper
  include AnnouncementHelper
end