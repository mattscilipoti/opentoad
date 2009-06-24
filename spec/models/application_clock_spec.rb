require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe ApplicationClock do

  share_examples_for "normal proxy ApplicationClock" do
    it "should forward on to DateTime.now" do
      DateTime.should_receive(:now).and_return(:mock_response)
      ApplicationClock.now.should == :mock_response
    end
  end

  context "with no configuration" do
    it_should_behave_like "normal proxy ApplicationClock"
  end

  context "when frozen" do
    it "should always respond with the same DateTime" do
      date = DateTime.parse("1999 Dec 31")
      ApplicationClock.freeze_at date
      ApplicationClock.now.should == date
    end

    context "and returned to normal" do
      before do
        date = 5.years.ago.to_datetime
        ApplicationClock.freeze_at date
        ApplicationClock.return_to_normal_time
      end
      it_should_behave_like "normal proxy ApplicationClock"
    end

  end

end
