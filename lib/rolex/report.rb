class Rolex
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
          elapsed = c.authored_date - previous.authored_date
        end

        if c.author.email.include?(who)
          @lines << LineItem.new(c.message, elapsed)
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
end