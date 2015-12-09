class EnvelopeController < ApplicationController
  def index
  end

  def new
    @envelope = Envelope.new
  end

  def show
    @sender = Envelope.find(params[:id])
  end

  def envelope_params
    params.require(:sender).permit(
      :name, :email,
    )
  end
end
