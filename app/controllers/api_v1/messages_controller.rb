class ApiV1::MessagesController < ApiController
  def index
    messages = Message.all
    render :json => messages, :only => [:id, :status, :category_name, :title, :content, :created_at]
  end
end
