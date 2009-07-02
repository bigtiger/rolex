require File.join(File.dirname(__FILE__),'spec_helper')

describe "Rolex" do
  before do
    @commits = ["commit1", "commit2"]
    @rolex = Rolex.new('.', "someuser")
    @report = stub('report', :run => true)
    @now = Time.now
  end

  it "reports on today" do
    @rolex.should_receive(:report_for).with(Date.today)
    @rolex.today
  end

  it "reports on last week" do
    @rolex.should_receive(:report_range).with("last week monday", "last week sunday")
    @rolex.last_week
  end

  it "reports on this week" do
    @rolex.should_receive(:report_range).with("last monday", "today")
    @rolex.this_week
  end

  describe "#report_for" do
    it "parses strings with Chronic" do
      Chronic.should_receive(:parse).with("yesterday").and_return(Time.now)
      @rolex.report_for("yesterday")
    end

    it "retrieves commits" do
      @rolex.repo.should_receive(:commits_since).with(nil, @now.to_date, :until => @now.to_date + 1, :author => @rolex.who).and_return(@commits)
      Rolex::Report.should_receive(:new).with(@commits).and_return(@report)
      @rolex.report_for(@now)
    end

    it "runs a report" do
      @rolex.repo.stub!(:commits_since => @commits)
      Rolex::Report.stub!(:new).and_return(@report)
      @report.should_receive(:run)
      @rolex.today
    end
  end

  describe "#report_range" do
    it "finds the commits for the given time period" do
      @rolex.should_receive(:report_for).at_least(2).times
      @rolex.report_range("yesterday", "today")
    end
  end
end
