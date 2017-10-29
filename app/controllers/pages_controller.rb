class PagesController < ApplicationController
  def home
    @help_requests = HelpRequest.active
  end
end
