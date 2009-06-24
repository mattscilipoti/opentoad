require File.expand_path('../../spec_helper', File.dirname(__FILE__))

describe "/error_groups/index.html.erb" do
  include ErrorGroupsHelper

  before(:each) do
    ApplicationClock.freeze_at Time.parse("2009 Jun 24")
    assigns[:error_groups] = [
      stub("Error group 1",
        :location => "ControllerA#foo_action",
        :message => "value for message",
        :latest => nil, #buggy/incomplete data?
        :count => 3
      ),
      stub("Error group 2",
        :location => "ControllerA#bar_action",
        :message => "another value for message 2",
        :latest => ApplicationClock.now - 2.minutes,
        :count => 3342434
      ),
      stub("Error group 3",
        :location => "ControllerB#index",
        :message => "errors galore",
        :latest => Time.parse("1999 Dec 31, 12:00"),
        :count => 1
      ),
    ]
  end

  it "renders a list of error groupings" do
    render
    response.should have_tag("td.error_location", "ControllerA#foo_action")
    response.should have_tag("td.error_message",  "another value for message 2")
    response.should have_tag("td.error_count",    "3342434")
    response.should have_tag("td.error_latest",   "Unknown")
    response.should have_tag("td.error_latest",   "2 minutes ago")
    response.should have_tag("td.error_latest",   "over 9 years ago")
  end
end
