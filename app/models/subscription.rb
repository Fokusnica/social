class Subscription < ActiveRecord::Base
  belongs_to :leader, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end

# Both :leader and :follower actually refer to
# a User , so you need to add the class name User . By default, Rails looks for
# model names that match association names. If you don’t specify a class
# name, Rails looks for models named Leader and Follower .