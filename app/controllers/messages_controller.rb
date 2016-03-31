class MessagesController < ApplicationController

  def index

  end

  def find_conversation
    @id = params[:conv_id]
    conv = Conversation.find(@id)
    if(conv.user_a_id==session[:user_id])
      @receiver_id = conv.user_b_id
    else
      @receiver_id = conv.user_a_id
    end
  end




end
