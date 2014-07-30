class Post < ActiveRecord::Base
 #attr_accessor :title, :content

 validates :title, :content, :presence => true
 validates :title, :length => { :minimum => 2 }
 validates :title, :uniqueness => true

end
