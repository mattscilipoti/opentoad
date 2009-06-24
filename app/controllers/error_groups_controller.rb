class ErrorGroupsController < ActionController::Base

  def index
    @error_groups = ErrorGroup.all
  end

end
