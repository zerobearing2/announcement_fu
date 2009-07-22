ActiveRecord::Schema.define(:version => 0) do 
  
  create_table :announcements, :force => true do |t| 
    t.text :message  
    t.datetime :starts_at
    t.datetime :ends_at
  end 
  
end