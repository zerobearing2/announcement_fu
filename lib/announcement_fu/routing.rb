module AnnouncementFu #:nodoc:  
  module Routing #:nodoc:  
    module MapperExtensions 
      
      def announcements 
        @set.add_route("/announcements/hide", {:controller => "announcements", :action => "hide"})  
      end  
      
    end  
  end 
end 
ActionController::Routing::RouteSet::Mapper.send :include, AnnouncementFu::Routing::MapperExtensions 
