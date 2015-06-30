class MessagesController < ApplicationController

  def index
    @messages = Message.page( params[:page] )
  end

  def show
    @message = Message.find( params[:id] )
  end

end
