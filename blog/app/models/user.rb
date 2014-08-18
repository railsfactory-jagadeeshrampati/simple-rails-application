class User < ActiveRecord::Base
 has_many :posts
 has_attached_file :image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates :user_name, :presence => { :message => "should not be empty" }
validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
validates :gender, :presence => { :message => "should not be empty" }
validates_uniqueness_of :user_name
end
