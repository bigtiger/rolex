class Rolex
  class LineItem
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