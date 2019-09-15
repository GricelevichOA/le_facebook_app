class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true

  scope :friends_posts, -> (current_user) { where('user_id IN (?) OR user_id = ?', current_user.friend_ids, current_user.id).order("created_at DESC") }
end
