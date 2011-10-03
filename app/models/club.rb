class Club < ActiveRecord::Base
  attr_accessible :name, :bio, :contact_info

  belongs_to :owner, :class_name => "User"
  
  validates :owner_id,      :presence => true
  validates :name,          :presence => true,
                            :length => { :maximum => 50 },
                            :uniqueness => { :case_sensitive => false }
  validates :bio,           :presence => true
  validates :contact_info,  :presence => true
end
