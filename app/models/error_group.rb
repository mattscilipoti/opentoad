class ErrorGroup < ActiveRecord::Base

  def self.for_message_and_location(message, location)
    find_by_message_and_location(
      message,
      location
    ) or create!(
      :message  => message,
      :location => location
    )
  end

  # TODO: base this off of latest (unless nil)
  def latest_occurance_text
    "Unknown"
  end

end
