require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/errors/show.html.erb" do
  include ErrorsHelper
  before(:each) do
    assigns[:error] = @error = stub_model(Error,
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

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ controller/)
    response.should have_text(/value\ for\ action/)
    response.should have_text(/value\ for\ exception_type/)
    response.should have_text(/value\ for\ message/)
    response.should have_text(/value\ for\ url/)
    response.should have_text(/value\ for\ request_type/)
    response.should have_text(/value\ for\ stack_trace/)
    response.should have_text(/value\ for\ env_vars/)
    response.should have_text(/value\ for\ session/)
    response.should have_text(/value\ for\ params/)
    response.should have_text(/value\ for\ hostname/)
    response.should have_text(/1/)
  end
end
