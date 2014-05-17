class Friendship
  include Mongoid::Document
  field :user_id, type: Integer
  field :friend_id, type: Integer
end
