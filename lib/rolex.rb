$:.unshift(File.dirname(__FILE__))

begin; require 'rubygems'; rescue LoadError; end
require 'grit'
require 'float_ext'

class Rolex
  attr_accessor :who

  def initialize(repo_location, who)
    @who = who
    @repo = Grit::Repo.new(repo_location)
  end

  def today
    commits = Grit::Commit.find_all(@repo, nil, :since => Time.today)
    Report.new(commits, who).run
  end

  class Report
    attr_reader :commits, :who

    def initialize(commits, who)
      @who = who
      @commits = commits.reverse
      @lines = []
    end

    def run
      commits.each_with_index do |c,i|
        elapsed = nil
        if c != commits.first
          previous = commits[i-1]
          elapsed = c.committed_date - previous.committed_date
        end

        if c.author.email.include?(who)
          @lines << Line.new(c.message, elapsed)
        end
      end
      @lines << "Total time: #{total_elapsed_time}"
      @lines.join("\n")
    end

    def total_elapsed_time
      total = 0
      @lines.each do |l|
        total += l.elapsed_time_in_hours
      end

      total
    end

  end

  class Line
    attr_accessor :message, :elapsed

    def initialize(message, elapsed)
      @message = message
      @elapsed = elapsed
    end

    def to_s
      "#{message} - #{elapsed_time_in_hours}"
    end

    def elapsed_time_in_hours
      (elapsed / 60 / 60).round_to(2)
    end
  end
end

