$:.unshift(File.dirname(__FILE__))

begin; require 'rubygems'; rescue LoadError; end
require 'grit'
require 'float_ext'

class Rolex
  autoload :Report, 'rolex/report'
  autoload :LineItem, 'rolex/line_item'
  
  attr_accessor :who

  def initialize(repo_location, who)
    @who = who
    @repo = Grit::Repo.new(repo_location)
  end

  def today
    commits = Grit::Commit.find_all(@repo, nil, :since => Time.today)
    Report.new(commits, who).run
  end
end

