require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/error_groups/index.html.erb" do
  include ErrorGroupsHelper

  before(:each) do
    assigns[:error_groups] = [
      stub("Error group 1",
        :location => "ControllerA#foo_action",
        :message => "value for message",
        :latest_occurance_text => 5.days.ago.to_s(:long),
        :count => 3
      ),
      stub("Error group 2",
        :location => "ControllerA#bar_action",
        :message => "another value for message 2",
        :latest_occurance_text => 2.minutes.ago.to_s(:long),
        :count => 3342434
      ),
      stub("Error group 3",
        :location => "ControllerB#index",
        :message => "errors galore",
        :latest_occurance_text => DateTime.parse("1999 Dec 31, 12:00").to_s(:long),
        :count => 1
      ),
    ]
  end

  it "renders a list of error groupings" do
    render
    response.should have_tag("tr>td", "ControllerA#foo_action")
    response.should have_tag("tr>td", "another value for message 2")
    response.should have_tag("tr>td", "3342434")
    response.should have_tag("tr>td", "December 31, 1999 12:00")
  end
end
