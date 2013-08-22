require 'spec_helper'

describe User do
  context 'validating the user' do
    it "should have valid factory" do
      FactoryGirl.build(:user).should be_valid
    end
    it "should require a username" do
      FactoryGirl.build(:user, username:'').should_not be_valid
    end
    it "should require a role" do
      FactoryGirl.build(:user, role:'').should_not be_valid
    end
  end
end
