require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/errors/edit.html.erb" do
  include ErrorsHelper

  before(:each) do
    assigns[:error] = @error = stub_model(Error,
      :new_record? => false,
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

  it "renders the edit error form" do
    render

    response.should have_tag("form[action=#{error_path(@error)}][method=post]") do
      with_tag('input#error_controller[name=?]', "error[controller]")
      with_tag('input#error_action[name=?]', "error[action]")
      with_tag('input#error_exception_type[name=?]', "error[exception_type]")
      with_tag('input#error_message[name=?]', "error[message]")
      with_tag('input#error_url[name=?]', "error[url]")
      with_tag('input#error_request_type[name=?]', "error[request_type]")
      with_tag('textarea#error_stack_trace[name=?]', "error[stack_trace]")
      with_tag('textarea#error_env_vars[name=?]', "error[env_vars]")
      with_tag('textarea#error_session[name=?]', "error[session]")
      with_tag('textarea#error_params[name=?]', "error[params]")
      with_tag('input#error_hostname[name=?]', "error[hostname]")
      with_tag('input#error_pid[name=?]', "error[pid]")
    end
  end
end
