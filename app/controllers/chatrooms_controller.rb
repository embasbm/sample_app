class ChatroomsController < ApplicationController
  before_action :logged_in_user

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      flash[:success] = "Chatroom created!"
      redirect_to chatrooms_path
    else
      render 'new'
    end
  end

  private
    def chatroom_params
      params.require(:chatroom).permit(:topic)
    end
end
