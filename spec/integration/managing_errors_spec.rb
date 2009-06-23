require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Managing Errors" do
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

  describe "viewing index" do
    it "lists all Errors" do
      error = Error.create!(@valid_attributes)
      visit errors_path
      response.should have_selector("a", :href => error_path(error))
    end
  end
end
