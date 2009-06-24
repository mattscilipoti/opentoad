require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe ErrorGroupsController do
  describe "GET #index" do
    it "should assign all error groups to @error_groups" do
      error_groups = stub("error groups")
      ErrorGroup.stub!(:all).and_return(error_groups)
      get :index
      assigns[:error_groups].should == error_groups
    end
  end
end
