require File.join(File.dirname(__FILE__),'spec_helper')

describe "Rolex" do
  before do
    @commits = ["commit1", "commit2"]
    @repo = Grit::Repo.stub!(:new).and_return('/some/path')
    @rolex = Rolex.new(@repo, "someuser")
    @report = stub('report', :run => true)
  end

  describe '#today' do 
    it "retrieves today's commits" do
      Grit::Commit.should_receive(:find_all).with('/some/path', nil, :since => anything).and_return(@commits)
      Rolex::Report.should_receive(:new).with(@commits, "someuser").and_return(@report)
      @rolex.today
    end
    
    it "runs a report" do
      Grit::Commit.should_receive(:find_all).and_return(@commits)
      Rolex::Report.stub!(:new).and_return(@report)
      @report.should_receive(:run)
      @rolex.today
    end
  end

end
