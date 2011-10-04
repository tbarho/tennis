require 'spec_helper'

describe ClubProRelationship do
  before(:each) do
    @club = Factory(:club)
    @pro = Factory(:user, :email => Factory.next(:email))
    @pro.toggle!(:pro)

    @relationship = @club.club_pro_relationships.build(:pro_id => @pro.id)
  end

  it "should create a new instance give valid attributes" do
    @relationship.save!
  end

  describe "relationship methods" do
    before(:each) do
      @relationship.save
    end
    it "should have a club attribute" do
      @relationship.should respond_to(:club)
    end
    it "should have the right club" do
      @relationship.club.should == @club
    end
    it "should have a pro attribute" do
      @relationship.should respond_to(:pro)
    end
    it "should have the right pro" do
      @relationship.pro.should == @pro
    end
  end

  describe "validations" do
    it "should require a club_id" do
      @relationship.club_id = nil
      @relationship.should_not be_valid
    end
    it "should require a pro_id" do
      @relationship.pro_id = nil
      @relationship.should_not be_valid
    end
    it "should require a User to have Pro status" do
      non_pro_user = Factory(:user, :email => Factory.next(:email))
      relationship = @club.club_pro_relationships.build(:pro_id => non_pro_user.id)
      relationship.should_not be_valid
    end
  end
end
