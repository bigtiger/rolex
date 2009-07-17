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

  def last_week
    report_range("last week monday", "last week sunday")
  end

  def report_for(date)
    date = date_for(date)
    commits = repo.commits_since 'HEAD', date, :until => date + 1, :author => who
    Report.new(commits).run
  end

  def report_range(starting, ending)
    starting = date_for starting
    ending = date_for ending
    (starting..ending).each do |date|
      report_for date
    end
  end

  def this_week
    report_range("last monday", "today")
  end

  def today
    report_for Date.today
  end

  private

  def date_for(time)
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
