require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/error_groups/new.html.erb" do
  include ErrorGroupsHelper

  before(:each) do
    assigns[:error_group] = stub_model(ErrorGroup,
      :new_record? => true,
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
    )
  end

  it "renders new error form" do
    render

  end
end
