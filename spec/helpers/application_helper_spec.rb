require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe ApplicationHelper, "relative time" do

  it "should delegate to distance_of_time_in_words and ApplicationClock" do
    helper.relative_time(5.minutes.ago).should == "5 minutes ago"
    ApplicationClock.freeze_at 15.minutes.ago
    helper.relative_time(30.minutes.ago).should == "15 minutes ago"
    helper.relative_time(5.minutes.ago).should == "10 minutes from now"
  end

  it "should gracefully handle nil with 'Unknown'" do
    helper.relative_time(nil).should == "Unknown"
  end

end
