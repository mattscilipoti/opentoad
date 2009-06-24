class ErrorReport < ActiveRecord::Base

  attr_writer :message, :location
  before_create :assign_error_group
  delegate :message, :location, :to => :error_group

  belongs_to :error_group, :counter_cache => :count

  private
  def assign_error_group
    self.error_group = ErrorGroup.for_message_and_location(
      @message,
      @location
    )
  end

end
