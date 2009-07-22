namespace :announcements do
  
  desc "Clear all announcements"
  task :clear => :environment do
    Announcement.clear
  end
  
  desc "Console"
  task :console => :environment do
    AnnouncementFu::Console.new
  end
  
end