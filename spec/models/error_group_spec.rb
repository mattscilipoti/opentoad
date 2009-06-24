require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe ErrorGroup, "attributes" do

  context "with no child error reports" do
    before do
      @it = ErrorGroup.create! :message => "foo", :location => "bar"
    end

    it "should have count of zero" do
      @it.count.should == 0
    end

    it "should report last_occurance as 'Unknown'" do
      @it.latest_occurance_text.should == "Unknown"
    end

  end

end
