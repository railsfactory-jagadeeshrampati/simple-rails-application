class Task < ActiveRecord::Base

 validates :name, :status, :presence => true
 validates :name, :uniqueness => true

end
