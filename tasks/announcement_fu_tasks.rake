namespace :announcements do
  
  desc "Clear all announcements"
  task :clear do
    Announcement.clear
  end
  
end