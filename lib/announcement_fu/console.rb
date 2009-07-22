require 'readline'
require 'pp'
require 'chronic'

module AnnouncementFu #:nodoc:  
  class Console
    #------------------
    def initialize
      run
    end
    
    #------------------
    def run
      # Store the state of the terminal
      stty_save = `stty -g`.chomp

      begin
        while line = Readline.readline('> ', true)
          commands(line)
        end
      rescue Interrupt => e
        system('stty', stty_save) # Restore
        exit
      rescue => e
        puts "ouch! #{e.to_s}"
        retry
      end

    end
    
    #------------------
    def commands(cmd)
      case cmd.to_s.downcase
      
      when 'del', 'delete', 'd'
        id = Readline.readline('delete id# > ')
        Announcement.destroy(id) if id.to_i>0
        puts "deleted #{id}"
        commands("l")
      
      when 'new', 'n'
        message = Readline.readline('message > ')
        puts "message will by: #{message}"
        
        starts_at = nil
        while(starts_at.nil?)
          starts_at = Chronic.parse(Readline.readline('start time > '))
          puts "invalid start" if starts_at.nil?
        end
        
        ends_at = nil
        while(ends_at.nil?)
          ends_at = Chronic.parse(Readline.readline('end time > '))
          puts "invalid end" if ends_at.nil?
        end
        
        yesno = Readline.readline("new announcement starting, #{starts_at.to_s(:short)} and ending, #{ends_at.to_s(:short)}; ok? > ")
        if ["y","yes"].include?(yesno.to_s.downcase)
          Announcement.create!(:message => message, :starts_at => starts_at, :ends_at => ends_at)
          commands("l")
        else
          puts "aborted"
        end
        
      when 'list', 'l'
        Announcement.all(:order => "starts_at asc").each do |a|
          puts "#{a.starts_at.localtime.to_s(:short)}\t#{a.ends_at.localtime.to_s(:short)}\tid:#{a.id}\t#{a.message[0,65]}..."
        end
        puts "================"

      when 'clear', 'c'
        if ["y","yes"].include? Readline.readline("clear all announcements? > ").to_s.downcase
          Announcement.clear
          puts "cleared all"
        else
          puts "aborted"
        end
        
      when 'help', 'h'
        puts "usage:\n=================="
        puts "(h)elp \tHelp"
        puts "(q)uit \tExit"
        puts "(l)ist \tList announcements"
        puts "(d)el \tDelete announcement by id #"
        puts "(n)ew \tCreate new announcement"

      when 'quit', 'exit', 'bye', 'q', 'x'
        raise Interrupt.new("exiting...")
   
      else
        puts "sorry, don't understand #{cmd}"
      end
   
    end
  end
end