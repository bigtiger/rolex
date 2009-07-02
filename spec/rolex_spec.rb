require File.join(File.dirname(__FILE__),'spec_helper')

describe "Rolex" do
  before do
    @commits = ["commit1", "commit2"]
    @rolex = Rolex.new('.', "someuser")
    @report = stub('report', :run => true)
    @now = Time.now
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

  it "finds the commits for the given time period" do

  end

  describe '#today' do 
  end
end
