module HelpRequestsHelper
  def is_user_request?
   # @help_request.author ==
   current_user
  end

  def is_draft_request?
    @help_request.state == 'draft'
  end

  def is_active_request?
    @help_request.state == 'active'
  end
end
