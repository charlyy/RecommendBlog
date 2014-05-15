class Post
  include Mongoid::Document
  include Mongoid::Paperclip
  field :blog_content, type: String
  
  belongs_to :user
  has_mongoid_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
