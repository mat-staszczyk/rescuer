class HelpRequestsController < ApplicationController
  before_action :set_help_request, except: [:new, :create, :index]

  def index
    @help_requests = HelpRequest.all
  end

  def show
  end

  def new
  end

  def create
    @help_request = HelpRequest.new(help_request_params)

    if @help_request.save
      redirect_to @help_request, notice: 'Prośba o pomoc została dodana.'
    else
      render :new
    end
  end

  def update
  end

  def activate 
    @help_request.activate
  end

  def destroy
  end

  private

  def set_help_request
    @help_request = HelpRequest.find(params[:id])
  end

  def help_request_params
    params.require(:help_request).permit(:title, :description, :author_id)
  end
end
