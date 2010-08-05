#require 'active_record'
#require './../../app/models/user'
require 'spec_helper'
describe User do
  before(:all) do
    @user = User.new
  end

  after(:all) do
  end

  specify "should return users with email" do
    @user.should_not_be_valid
  end
end
