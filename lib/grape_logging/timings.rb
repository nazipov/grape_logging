module GrapeLogging
  module Timings
    extend self

    def db_runtime=(value)
      Thread.current[:grape_db_runtime] = value
    end

    def db_runtime
      Thread.current[:grape_db_runtime] ||= 0
    end

    def db_count=(value)
      Thread.current[:grape_db_count] = value
    end

    def db_count
      Thread.current[:grape_db_count] ||= 0
    end

    def reset_db_runtime
      self.db_runtime = 0
      self.db_count = 0
    end

    def append_db_runtime(event)
      self.db_runtime += event.duration
      self.db_count += 1
    end
  end
end
