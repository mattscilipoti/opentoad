class ErrorReport < ActiveRecord::Base

  belongs_to :error_group, :counter_cache => :count
  before_create :assign_error_group
  after_save    :update_error_group_latest
  attr_writer :message, :location
  delegate :message, :location, :to => :error_group

  private
  def assign_error_group
    self.error_group = ErrorGroup.for_message_and_location(
      @message,
      @location
    )
  end

  def update_error_group_latest
    # done via class method, to avoid race conditions
    ErrorGroup.update_latest_time(error_group_id)
    #self.error_group.update_attributes! :latest => self.time
  end

end
