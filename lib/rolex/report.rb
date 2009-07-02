class Rolex
  class Report
    attr_reader :commits, :lines
    private :lines

    def initialize(commits)
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

        lines << LineItem.new(c.message, elapsed)
      end
      lines << "Total time: #{total_elapsed_time}" if lines.any?
      puts lines.join("\n")
    end

    def total_elapsed_time
      total = 0
      lines.each do |l|
        total += l.elapsed_time_in_hours
      end

      total
    end

  end
end
