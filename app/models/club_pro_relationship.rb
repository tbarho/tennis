class ClubProRelationship < ActiveRecord::Base
  attr_accessible :pro_id

  belongs_to :club
  belongs_to :pro, :class_name => "User"

  validates :club_id, :presence => true
  validates :pro_id, :presence => true
  
  validate :user_must_have_pro_status

  private

  def user_must_have_pro_status
    errors.add(:pro_id, "must have pro status") unless self.pro && self.pro.pro?
  end
end
