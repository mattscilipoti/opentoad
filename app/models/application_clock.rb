# A simple class to help out with date/time related things.
# mostly to avoid the non-determinate nature of Time.now
#
# Use in specs
#
# Similar to http://github.com/jtrupiano/timecop/tree/master but much
# simpler (and requires the client code to be aware of it).
class ApplicationClock
  def self.now
    @current_frozen_time || Time.now
  end

  def self.freeze_at(time)
    @current_frozen_time = time
  end

  def self.return_to_normal_time
    @current_frozen_time = nil
  end
end
