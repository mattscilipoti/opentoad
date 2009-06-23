require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/errors/index.html.erb" do
  include ErrorsHelper

  before(:each) do
    assigns[:errors] = [
      stub_model(Error,
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
      ),
      stub_model(Error,
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
    ]
  end

  it "renders a list of errors" do
    render
    response.should have_tag("tr>td", "value for controller".to_s, 2)
    response.should have_tag("tr>td", "value for action".to_s, 2)
    response.should have_tag("tr>td", "value for exception_type".to_s, 2)
    response.should have_tag("tr>td", "value for message".to_s, 2)
    response.should have_tag("tr>td", "value for url".to_s, 2)
    response.should have_tag("tr>td", "value for request_type".to_s, 2)
    response.should have_tag("tr>td", "value for stack_trace".to_s, 2)
    response.should have_tag("tr>td", "value for env_vars".to_s, 2)
    response.should have_tag("tr>td", "value for session".to_s, 2)
    response.should have_tag("tr>td", "value for params".to_s, 2)
    response.should have_tag("tr>td", "value for hostname".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
