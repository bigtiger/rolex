require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Rolex" do
  before do
    @rolex = Rolex.new("~/hashrocket/newhomeguide", "bigtiger")
  end

  describe '#today' do 
    it "retrieves today's commits" do
      Grit::Commit.should_receive(:find_all)
      @rolex.today
    end
  end

end
