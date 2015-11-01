class Post < ActiveRecord::Base

# All posts in our social application belong to an individual user. This
# validation ensures that a Post can’t be created without an associated user_id.
# The type validation validates that all records are identified as either a
# TextPost or an ImagePost .

  belongs_to :user
  validates :user_id, presence: true
  validates :type, presence: true

  has_many :comments
end
