ENV['RAILS_ENV'] = 'test' 
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..' 
require 'test/unit' 
require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb')) 
require 'test_help'
require "shoulda"

#------------------
class ActiveSupport::TestCase
end


#------------------
def load_schema 
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))  
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")  
  ActiveRecord::Base.establish_connection(config[ENV['RAILS_ENV']])  
  load(File.dirname(__FILE__) + "/schema.rb")  
  
  require File.dirname(__FILE__) + '/../init.rb' 
end 
load_schema 
