$:.unshift(File.dirname(__FILE__))

begin; require 'rubygems'; rescue LoadError; end
require 'grit'
require 'trollop'
require 'chronic'

require 'float_ext'
require 'time_ext'

class Rolex
  autoload :Report, 'rolex/report'
  autoload :LineItem, 'rolex/line_item'

  attr_reader :repo
  attr_accessor :who

  def initialize(repo_location, who)
    @who = who
    @repo = Grit::Repo.new(repo_location)
  end

  def report_for(date)
    date = get_date(date)
    commits = repo.commits_since nil, date, :until => date + 1, :author => who
    Report.new(commits).run
  end

  def today
    report_for Date.today
  end

  private

  def get_date(time)
    case time
    when String
      Chronic.parse(time).to_date
    when Time
      time.to_date
    when Date
      time
    end
  end
end
