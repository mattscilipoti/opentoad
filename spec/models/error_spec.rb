require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Error do
  before(:each) do
    @valid_attributes = {
      :controller => "value for controller",
      :action => "value for action",
      :exception_type => "value for exception_type",
      :message => "value for message",
      :url => "value for url",
      :request_type => "value for request_type",
      :stack_trace => "value for stack_trace",
      :env_vars => "value for env_vars",
      :session => "value for session",
      :params => "value for params",
      :hostname => "value for hostname",
      :pid => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Error.create!(@valid_attributes)
  end
end
