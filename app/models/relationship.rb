class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :followed_type

  belongs_to :follower, :polymorphic => true
  belongs_to :followed, :polymorphic => true

  validates :follower_id, :followed_id, :follower_type, :followed_type, :presence => true

#  def follower_type=(sType)
#    super(sType.to_s.classify.constantize.base_class.to_s)
#  end

#  def followed_type=(sType)
#    super(sType.to_s.classify.constantize.base_class.to_s)
#  end

end
