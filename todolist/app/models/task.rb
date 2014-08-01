class Task < ActiveRecord::Base
belongs_to :user

 validates :name, :status, :presence => true
 validates :name, :uniqueness => true

end
