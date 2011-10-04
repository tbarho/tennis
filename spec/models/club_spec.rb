require 'spec_helper'

describe Club do
  before(:each) do
    @user = Factory(:user)
    @attr = {
      :name => "Sample Club",
      :bio  => "The premier club in Horshoe Bay Texas.  Our tennis program has lots of users",
      :contact_info => "1234 My Street, Austin, TX 78759"
    }
  end
  it "should createa a new instance given valid attributes" do
    @user.clubs.create!(@attr)
  end
  
  describe "validations" do
    it "should require an owner id" do
      Club.new(@attr).should_not be_valid
    end
    it "should require a non-blank name" do
      @user.clubs.build(:name => "    ").should_not be_valid
    end
    it "should not allow names longer than 51 chars" do
      @user.clubs.build(@attr.merge(:name => "a" * 51)).should_not be_valid
    end
    it "should not allow duplicate names" do
      @user.clubs.create!(@attr)
      club_with_same_name = @user.clubs.build(@attr)
      club_with_same_name.should_not be_valid
    end
    it "should not allow duplicate names with different cases" do
      @user.clubs.create!(@attr)
      upper_cased_name = @attr[:name].upcase
      club_with_same_name = @user.clubs.build(@attr.merge(:name => upper_cased_name))
      club_with_same_name.should_not be_valid
    end
    it "should require a non-blank bio" do
      @user.clubs.build(@attr.merge(:bio => "   ")).should_not be_valid
    end
    it "should require a non-blank contact_info" do
      @user.clubs.build(@attr.merge(:contact_info => "   ")).should_not be_valid
    end
  end

  describe "user associations" do
    before(:each) do
      @club = @user.clubs.create!(@attr)
    end

    describe "owner relationship" do
      before(:each) do
        @owner = @user
      end
      it "should have an owner attribute" do
        @club.should respond_to(:owner)
      end
      it "should have the right owner" do
        @club.owner_id.should == @owner.id
        @club.owner.should == @owner
      end
    end

    describe "pros relationship" do
      before(:each) do
        @pro = Factory(:user, :email => Factory.next(:email))
        @pro.toggle!(:pro)
      end
      it "should have a pros attribute" do
        @club.should respond_to(:pros)
      end
      it "should have a pro! method" do
        @club.should respond_to(:pro!)
      end
      it "should include the pro User in the pros array" do
        @club.pro!(@pro)
        @club.pros.should include(@pro)
      end
      it "should have an unpro! method" do
        @club.should respond_to(:unpro!)
      end
      it "should prohibit the pro User from being a Club pro" do
        @club.pro!(@pro)
        @club.unpro!(@pro)
        @club.pros.should_not include(@pro)
      end 
    end

  end

end
