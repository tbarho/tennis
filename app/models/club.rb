class Club < ActiveRecord::Base
  attr_accessible :name, :bio, :contact_info

  belongs_to :owner, :class_name => "User"

  has_many :club_pro_relationships, :foreign_key => "club_id", :dependent => :destroy
  has_many :pros, :through => :club_pro_relationships, :source => :pro
  
  validates :owner_id,      :presence => true
  validates :name,          :presence => true,
                            :length => { :maximum => 50 },
                            :uniqueness => { :case_sensitive => false }
  validates :bio,           :presence => true
  validates :contact_info,  :presence => true

  def pro!(pro)
    club_pro_relationships.create!(:pro_id => pro.id)
  end

  def unpro!(pro)
    club_pro_relationships.find_by_pro_id(pro.id).destroy
  end
end
