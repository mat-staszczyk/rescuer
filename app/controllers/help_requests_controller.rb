class HelpRequestsController < ApplicationController
  before_action :set_help_request, except: [:new, :create]

  def show
  end

  def new
    @help_request = HelpRequest.new
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


  def destroy
  end

  def activate
    if @help_request.activate
      redirect_to @help_request, notice: 'Prośba o pomoc została aktywowana.'
    else
      redirect_to @help_request, alert: @help_request.errors[:state].join('; ')
    end
  end

  def cancel
    if @help_request.cancel
      redirect_to @help_request, notice: 'Prośba o pomoc została anulowana.'
    else
      redirect_to @help_request, alert: @help_request.errors[:state].join('; ')
    end
  end

  def complete
    if @help_request.complete
      redirect_to @help_request, notice: 'Prośba o pomoc została ukończona.'
    else
      redirect_to @help_request, alert: @help_request.errors[:state].join('; ')
    end
  end

  private

  def set_help_request
    @help_request = HelpRequest.find(params[:id])
  end

  def help_request_params
    params.require(:help_request).permit(:title, :description, :author_id)
  end
end
