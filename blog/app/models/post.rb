class Post < ActiveRecord::Base
belongs_to :user
has_many :comments, :dependent => :destroy
 validates :title, :content, :presence => true 
 #validates :title, :uniqueness => true, :scope => :user_id
 validates_uniqueness_of :title, scope: :user_id

end
