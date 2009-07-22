namespace :announcements do
  
  desc "Clear all announcements"
  task :clear => :environment do
    Announcement.clear
  end
  
  desc "Console"
  task :console => :environment do
    AnnouncementFu::Console.new
  end
  
  desc "Create maint. announcement"
  task :create_maint => :environment do
    start_t = (ENV['start']||15.minutes.ago).to_time.utc
    end_t = (ENV['end']||30.minutes.from_now).to_time.utc
    a = Announcement.create!(:message => "Site will be under maintenance between #{start_t.to_s(:short)} and #{end_t.to_s(:short)}.", :starts_at => start_t, :ends_at => end_t)
    puts a.message unless a.nil?
  end
end