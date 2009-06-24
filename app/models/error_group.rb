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

  def self.update_latest_time(id)
    sql = <<-SQL
      latest = (select max(time)
                from error_reports
                where error_group_id = #{quote_value(id)})
    SQL
    update_all(sql, {:id => id})
  end

  # TODO: base this off of latest (unless nil)
  def latest_occurance_text
    "Unknown"
  end

end
