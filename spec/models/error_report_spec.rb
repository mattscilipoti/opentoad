require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe ErrorReport do

  before do
    ErrorGroup.destroy_all
    @it = ErrorReport.create!(
      :message  => "Foo: bar",
      :location => "FooController#bar_action",
      :time     => DateTime.parse("Dec 31 1999")
    )
  end

  it "should automatically create a matching ErrorGroup" do
    @it.error_group.should_not be_nil
    @it.error_group.message.should  == "Foo: bar"
    @it.error_group.location.should == "FooController#bar_action"
  end

  it "should delegate message and location to its ErrorGroup" do
    @it.message.should  eql(@it.error_group.message)
    @it.location.should eql(@it.error_group.location)
  end

  it "should increment the counter cache" do
    @it.error_group.reload # why doesn't rails do this for us?
    @it.error_group.count.should == 1
  end

  context "with a second matching report" do
    before do
      @second_report = ErrorReport.create!(
        :message  => "Foo: bar",
        :location => "FooController#bar_action",
        :time     => DateTime.parse("Feb 14 2003")
      )
    end

    it "should reuse an existing matching ErrorGroup" do
      @it.error_group.should == @second_report.error_group
    end

    it "should increment the counter" do
      @it.error_group.reload # why doesn't rails do this for us?
      @it.error_group.count.should == 2
    end

  end

  # see ErrorGroup spec for details related to time and count

end
