class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :text_comment, type: String
  belongs_to :posts
  belongs_to :users
end
