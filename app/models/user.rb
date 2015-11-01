class User < ActiveRecord::Base
	
# 	Start with the fact that a user has many subscriptions. In this case, you
# need to specify the foreign key to use. Normally, you would call this user_id ,
# but you’re modeling leaders and followers, so call it follower_id instead .
# Also specify what happens if this user is deleted with dependent: :destroy .
# This tells Rails to destroy any associated subscriptions if this user is ever
# destroyed. Finally, add the has_many:through association to leaders .

has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
has_many :leaders, through: :subscriptions

# This association is the reverse of the existing :subscriptions association.
# This association uses the leader_id field as the foreign key. Because the
# association name doesn’t match the name of the model, you also need to 
# specify a class name. As with the subscription association, also specify
# dependent: :destroy.  After adding the :reverse_subscriptions association, 
# you can use it to add another has_many :through association for :followers.

has_many :reverse_subscriptions, foreign_key: :leader_id, class_name: 'Subscription', dependent: :destroy
has_many :followers, through: :reverse_subscriptions

# Add a predicate method, a method returning a true or false value,
# called following? to see if the current user is following another user. This
# method checks to see if the current user’s leaders collection includes the
# leader passed as an argument to the method.

def following?(leader)
	leaders.include? leader
end

# Add the follow! method to indicate that the current user is
# following another user. This method ensures the current user isn’t trying
# to follow himself or herself and isn’t already following the other user. If
# neither case is true, the leader passed to this method is inserted into the
# current user’s leaders collection with << , the insertion operator.

def follow!(leader)
	if leader != self && !following?(leader)
		leaders << leader
	end
end


end
