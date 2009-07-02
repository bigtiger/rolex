class Rolex
  class LineItem
    attr_reader :commit_message, :elapsed

    def initialize(commit_message, elapsed)
      @commit_message = commit_message
      @elapsed = elapsed
    end

    def elapsed_time_in_hours
      elapsed.nil? ? 0 : (elapsed / 60 / 60).round_to(2)
    end

    def message
      commit_message.map do |line|
        new_line = line.strip.gsub(/^- /,'')
        new_line unless new_line.empty?
      end.compact.join "; "
    end

    def to_s
      "#{message} - #{elapsed_time_in_hours}"
    end
  end
end
