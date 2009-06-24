# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def relative_time(time)
    return "Unknown" unless time
    distance  = distance_of_time_in_words(ApplicationClock.now, time)
    direction = ((ApplicationClock.now > time) ? " ago" : " from now")
    distance + direction
  end

end
